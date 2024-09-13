import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/services/auth.dart';
import 'package:stardust_app_skeleton/features/shop/wrapper.dart';

class LoginController extends GetxController {
  final Auth _auth = Auth();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    try {
      final user = await _auth.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (user['authenticated']) {
        Get.to(() => const ScreenWrapper());
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
