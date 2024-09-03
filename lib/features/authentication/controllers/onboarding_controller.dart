import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables
  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  /// Update Current Index when Page Scrolled
  void updatePageIndicator(int index) => currentIndex.value = index;

  /// Jump to the specific page
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  /// Update Current Index and Jump to next page
  void nextPage() {
    if (currentIndex.value == 2) {
      // Get.offAll(() => const LoginScreen());
    } else {
      currentIndex.value++;
      pageController.animateToPage(currentIndex.value,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  /// Update Current Index and Jump to the last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.animateToPage(2,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}