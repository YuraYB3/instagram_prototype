import 'user_service.dart';

abstract interface class IUserService {
  void signWithGoogle();
  void logOut();
  Stream<UserState> userStateStream();
}
