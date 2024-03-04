import '../ibase_mode.dart';

abstract interface class IPost implements IBaseModel {
  String userID;
  String userName;
  String userImage;
  String? location;
  String? description;
  String postImage;

  IPost(
      {required this.userID,
      required this.userName,
      required this.userImage,
      this.location,
      this.description,
      required this.postImage});
}
