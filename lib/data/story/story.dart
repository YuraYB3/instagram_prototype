import 'package:instagram_prototype/domain/story/istory.dart';

class Story implements IStory {
  @override
  String id;
  @override
  String userName;
  @override
  String storyImage;

  Story({this.id = '', required this.storyImage, required this.userName});

  @override
  Map<String, dynamic> toJson() {
    //  implement toJson
    throw UnimplementedError();
  }
}
