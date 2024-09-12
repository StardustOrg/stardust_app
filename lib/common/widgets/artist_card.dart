import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            StarColors.bgLight.withOpacity(0.8),
            Colors.transparent,
          ],
          stops: const [0.72, 1.0],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstIn,
      child: Container(
        width: double.infinity,
        height: 210,
        decoration: const BoxDecoration(
          color: Color(0xFFD5D5D5),
        ),
      ),
    );
  }
}
