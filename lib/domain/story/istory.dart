import '../ibase_mode.dart';

abstract interface class IStory implements IBaseModel {
  String userName;
  String storyImage;

  IStory({required this.userName, required this.storyImage});
}
