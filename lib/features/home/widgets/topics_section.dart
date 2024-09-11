import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/section_title.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class TopicsSection extends StatelessWidget {
  const TopicsSection({
    super.key,
    required this.topics,
  });

  final List<String> topics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: StarTexts.recommendationsTopics,
          color: StarColors.starPink,
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: topics.map((topic) {
              return Row(
                children: [
                  Container(
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
                  ),
                  const SizedBox(width: 10),
                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
