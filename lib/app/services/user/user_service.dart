import 'dart:async';

import '../auth/iauth_service.dart';
import 'iuser_service.dart';

enum UserState { readyToWork, notAuthorized }

class UserService implements IUserService {
  final IAuthService _authService;
  final StreamController<UserState> _userStateStreamController =
      StreamController();

  UserService({required IAuthService authService}) : _authService = authService;

  @override
  void logOut() async {
    await _authService.signOut();
  }

  @override
  void signWithGoogle() {
    _authService.signInWithGoogle();
  }

  @override
  Stream<UserState> userStateStream() {
    Stream<UserState> userStream = _authService.authState().map((event) {
      switch (event) {
        case AuthState.authorized:
          return UserState.readyToWork;
        case AuthState.unauthorized:
          return UserState.notAuthorized;
      }
    });
    userStream.listen((event) {
      _userStateStreamController.add(event);
    });
    return _userStateStreamController.stream;
  }
}
