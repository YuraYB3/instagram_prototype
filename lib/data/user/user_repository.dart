// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_prototype/data/user/user.dart';
import 'package:instagram_prototype/domain/user/iuser.dart';

class UserRepository {
  final String? uid;

  UserRepository({required this.uid});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String surname, String email) async {
    return await usersCollection
        .doc(uid)
        .set({'name': name, 'surname': surname, 'email': email, 'userID': uid});
  }

  List<IUSer>? _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel(
          name: doc.get('name') ?? "",
          surname: doc.get('surname') ?? "",
          email: doc.get('email'));
    }).toList();
  }

  Stream<List<IUSer>?> get users {
    return usersCollection.snapshots().map(_userListFromSnapshot);
  }
}
