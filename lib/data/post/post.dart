import 'package:instagram_prototype/domain/post/ipost.dart';

class PostModel implements IPost {
  @override
  String id;
  @override
  String userID;
  @override
  String userName;
  @override
  String userImage;
  @override
  String? location;
  @override
  String? description;
  @override
  String postImage;

  PostModel(
      {this.id = '',
      required this.userID,
      required this.userName,
      required this.userImage,
      this.location,
      required this.postImage,
      this.description});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'],
      userID: json['userID'],
      userName: json['userName'],
      userImage: json['userImage'],
      location: json['location'],
      description: json['description'],
      postImage: json['postImage']);

  @override
  Map<String, dynamic> toJson() => {
        'userID': userID,
        'userName': userName,
        'userImage': userImage,
        'location': location,
        'description': description,
        'postImage': postImage
      };
}
