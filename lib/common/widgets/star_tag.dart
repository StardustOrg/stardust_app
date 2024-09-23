import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/features/shop/tag_page/screens/tag_screen.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class StarTag extends StatelessWidget {
  const StarTag({
    super.key,
    required this.topic,
    this.goToScreen = false,
  });

  final Map<String, dynamic> topic;
  final bool goToScreen;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(100),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        highlightColor: StarColors.starBlue.withOpacity(0.1),
        onTap: () {
          StarLoggerHelper.info('Tag: ${topic['name']}');
          if (goToScreen) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TagScreen(tagId: topic['id']),
              ),
            );
          }
        },
        child: Container(
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
            topic['name'],
            style: const TextStyle(
              fontSize: 14,
              color: StarColors.starBlue,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
