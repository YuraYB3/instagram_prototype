class PostModel {
  String userName;
  String userImage;
  String location;
  String? description;
  String postImage;

  PostModel(
      {required this.userName,
      required this.userImage,
      required this.location,
      required this.postImage,
      this.description});
}
