import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class PhotocardDescription extends StatefulWidget {
  const PhotocardDescription({super.key, required this.description});

  final String? description;

  @override
  State<PhotocardDescription> createState() => _PhotocardDescriptionState();
}

class _PhotocardDescriptionState extends State<PhotocardDescription> {
  bool isExpanded = false;
  final String description =
      "Descrição não informada pelo vendedor. Entre em contato para mais informações.";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                StarTexts.description,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(
                StarImages.sparkles,
                colorFilter: const ColorFilter.mode(
                  StarColors.starPink,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              final textSpan = TextSpan(
                text:
                    widget.description == '' ? description : widget.description,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                ),
              );

              final textPainter = TextPainter(
                text: textSpan,
                maxLines: isExpanded ? null : 4,
                textDirection: TextDirection.ltr,
              );
              textPainter.layout(maxWidth: constraints.maxWidth);

              bool textOverflow = textPainter.didExceedMaxLines;

              return Column(
                children: [
                  Stack(
                    children: [
                      Text.rich(
                        textSpan,
                        maxLines: isExpanded ? null : 4,
                        overflow: TextOverflow.clip,
                      ),
                      if (textOverflow && !isExpanded)
                        Positioned(
                          left: 0,
                          bottom: -20,
                          right: 0,
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, -1.50),
                                end: Alignment(0, 1),
                                colors: [Color(0x00FDFEF0), Color(0xFFFDFEF0)],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (textOverflow || isExpanded)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child:
                            Text(isExpanded ? 'Ver menos...' : 'Ver mais...'),
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
