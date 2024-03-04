// ignore_for_file: file_names, avoid_print
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_prototype/app/services/auth/iauth_service.dart';

import '../../../data/user/user_repository.dart';

class AuthService implements IAuthService {
  final FirebaseAuth _auth;
  final StreamController<AuthState> _streamController =
      StreamController.broadcast();

  @override
  FirebaseAuth get firebaseAuth => _auth;

  AuthService({required FirebaseAuth firebaseAuth}) : _auth = firebaseAuth;

  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future register(
      String email, String password, String name, String surname) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await UserRepository(uid: user?.uid).updateUserData(name, surname, email);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }

  @override
  Stream<AuthState> authState() {
    Stream<AuthState> stream = _auth.authStateChanges().map((firebaseUser) {
      if (firebaseUser != null) {
        return AuthState.authorized;
      } else {
        return AuthState.unauthorized;
      }
    });
    stream.listen((authState) {
      _streamController.add(authState);
    });
    return _streamController.stream;
  }

  @override
  Future signInWithPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      return null;
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print("Error signing in with Google: $error");
      return null;
    }
  }
}
