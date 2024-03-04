// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_prototype/data/post/post.dart';

class PostRepository {
  final String? document;

  const PostRepository(this.document);
  Stream<List<PostModel>> readUserPosts() => FirebaseFirestore.instance
      .collection('posts')
      .where('userID', isEqualTo: document)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => PostModel.fromJson(doc.data())).toList());

  Stream<List<PostModel>> readAllUsersPosts() => FirebaseFirestore.instance
      .collection('posts')
      .where('userID', isNotEqualTo: document)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => PostModel.fromJson(doc.data())).toList());
}
