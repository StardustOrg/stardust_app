import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stardust_app_skeleton/repository/user_repository.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository = UserRepository();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get user => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return {'authenticated': true, 'user': userCredential.user};
    } catch (e) {
      print("Sign in error: $e");

      return {'authenticated': false, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return {
          'authenticated': false,
          'error': 'Google sign-in aborted by user'
        };
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        final uid = userCredential.user!.uid;

        // Check if user exists in Firestore and add if not
        final userDoc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (!userDoc.exists) {
          final email = userCredential.user!.email!;
          final username = email.split('@')[0];
          await _userRepository.createUser(uid, username, email);
        }

        return {'authenticated': true};
      } else {
        return {'authenticated': false, 'error': 'User credential is null'};
      }
    } catch (e) {
      print("Google sign-in error: $e");
      return {'authenticated': false, 'error': e.toString()};
    }
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      print("Attempting to sign up with email: $email");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        print("User signed up successfully, uid: ${userCredential.user!.uid}");
        await _userRepository.createUser(userCredential.user!.uid, name, email);
      } else {
        print("User credential is null");
      }
    } catch (e) {
      print("Sign up error: $e");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
