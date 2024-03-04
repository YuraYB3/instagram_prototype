import 'package:firebase_auth/firebase_auth.dart';

enum AuthState { unauthorized, authorized }

abstract interface class IAuthService {
  Stream<AuthState> authState();
  FirebaseAuth get firebaseAuth;
  bool isUserLoggedIn();
  Future signOut();
  Future register(String email, String password, String name, String surname);
  Future signInWithPassword(String email, String password);
  Future signInWithGoogle();
}
