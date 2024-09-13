import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(String uid, String name) async {
    try {
      print("Attempting to create user with uid: $uid and name: $name");
      await _db.collection('users').doc(uid).set({
        'username': name,
      });
      print("User created successfully");
    } catch (e) {
      print("Error adding user to Firestore: $e");
    }
  }
}
