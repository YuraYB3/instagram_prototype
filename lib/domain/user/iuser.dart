import '../ibase_mode.dart';

abstract interface class IUSer implements IBaseModel {
  final String name;
  final String surname;
  final String email;

  IUSer({required this.name, required this.surname, required this.email});
}
