import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class PhotocardInformation extends StatelessWidget {
  const PhotocardInformation({
    super.key,
    required this.artistName,
    required this.pcName,
    required this.groupName,
  });

  final String artistName, pcName, groupName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(),
          Text(
            groupName,
            style: const TextStyle(
              color: StarColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            artistName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 0,
              color: StarColors.textPrimary,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            pcName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 0,
              color: StarColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
