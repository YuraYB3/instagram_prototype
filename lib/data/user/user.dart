import 'package:instagram_prototype/domain/user/iuser.dart';

class UserModel implements IUSer {
  @override
  final String name;
  @override
  final String surname;
  @override
  final String email;
  @override
  String id;

  UserModel(
      {this.id = '',
      required this.name,
      required this.surname,
      required this.email});

  @override
  toJson() {
    return {"name": name, "surname": surname, "email": email};
  }
}
