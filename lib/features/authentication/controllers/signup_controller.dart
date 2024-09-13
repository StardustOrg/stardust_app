import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/services/auth.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/login.dart'; // Import da tela de login

class SignupController extends GetxController {
  final Auth _auth = Auth(); // Instância da classe Auth para autenticação

  // Chave de formulário para validar o formulário de cadastro
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controladores de texto para cada campo de entrada
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Método para lidar com o cadastro
  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      try {
        // Chama o método de cadastro da classe Auth
        await _auth.signUpWithEmailAndPassword(
            email, password, usernameController.text.trim());

        // Exibe um alerta de sucesso
        Get.snackbar(
          'Sucesso',
          'Usuário criado com sucesso!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Redireciona para a tela de login
        Get.off(() => const LoginScreen());
      } catch (e) {
        // Exibe um alerta de erro
        Get.snackbar(
          'Erro',
          'Não foi possível criar o usuário. Tente novamente.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
