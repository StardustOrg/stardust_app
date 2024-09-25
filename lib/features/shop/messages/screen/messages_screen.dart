import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/no_messages.svg',
                width: StarDeviceUtils.getScreenWidth(context) * 0.5,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: StarDeviceUtils.getScreenWidth(context) * 0.5,
                child: const Text(
                  'Você ainda não iniciou nenhuma conversa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: StarDeviceUtils.getScreenWidth(context) * 0.7,
                child: const Text(
                  'Inicie uma conversa com uma loja para tirar suas dúvidas e ela irá aparecer aqui.',
                  style: TextStyle(
                    fontSize: 16,
                    color: StarColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
