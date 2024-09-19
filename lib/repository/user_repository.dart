import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/models/user.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(String uid, String name, String email) async {
    try {
      StarLoggerHelper.debug(
          "Attempting to create user with uid: $uid and name: $name");
      await _db.collection('users').doc(uid).set({
        'username': name,
        'email': email,
        'uid': uid,
      });
      StarLoggerHelper.debug("User created successfully");
    } catch (e) {
      StarLoggerHelper.error("Error creating user: $e");
    }
  }

  StarUser _userFromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return StarUser(
      uid: snapshot.id,
      username: data['username'],
      email: data['email'],
      icon: data['icon'],
      cover: data['cover'],
    );
  }

  Stream<StarUser> getUser(String uid) {
    return _db.collection('users').doc(uid).snapshots().map(_userFromSnapshot);
  }

  Future<StarUser> getUserOnce(String uid) async {
    var snapshot = await _db.collection('users').doc(uid).get();
    return _userFromSnapshot(snapshot);
  }
}
