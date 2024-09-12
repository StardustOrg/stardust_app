import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class StarTag extends StatelessWidget {
  const StarTag({
    super.key,
    required this.topic,
  });

  final String topic;

  @override
  Widget build(BuildContext context) {
    // TODO: fazer ser clicável
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: StarColors.starBlue,
          width: 1,
        ),
      ),
      child: Text(
        topic,
        style: const TextStyle(
          fontSize: 14,
          color: StarColors.starBlue,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
