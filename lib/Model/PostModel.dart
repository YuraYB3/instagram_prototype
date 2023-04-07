class PostModel {
  String userID;
  String userName;
  String userImage;
  String? location;
  String? description;
  String postImage;

  PostModel(
      {required this.userID,
      required this.userName,
      required this.userImage,
      this.location,
      required this.postImage,
      this.description});
  static PostModel fromJson(Map<String, dynamic> json) => PostModel(
      userID: json['userID'],
      userName: json['userName'],
      userImage: json['userImage'],
      location: json['location'],
      description: json['description'],
      postImage: json['postImage']);

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'userName': userName,
        'userImage': userImage,
        'location': location,
        'description': description,
        'postImage': postImage
      };
}
