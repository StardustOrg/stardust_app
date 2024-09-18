// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/features/auth_controller.dart';
import 'package:stardust_app_skeleton/services/auth.dart';

class LoginController extends GetxController {
  final Auth _auth = Auth();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> login(BuildContext context) async {
    isLoading.value = true;
    try {
      final user = await _auth.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (user['authenticated']) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AuthController(),
            ),
            (route) => false);
      } else {
        Get.snackbar('Login Failed', 'Invalid email or password',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
