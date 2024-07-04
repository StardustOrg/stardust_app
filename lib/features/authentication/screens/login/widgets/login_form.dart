import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Entre com a sua conta",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "E-mail",
              hintText: "Digite o seu e-mail",
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Senha",
              hintText: "Digite a sua senha",
            ),
          ),
          const SizedBox(height: StarSizes.xxs),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text("Esqueceu a senha?"),
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwSections),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 0),
            ),
            child: const Text("Entrar com e-mail"),
          ),
          const SizedBox(height: StarSizes.xxs),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {},
              child: const Text("Não tem uma conta? Cadastre-se!"),
            ),
          ),
        ],
      ),
    );
  }
}
