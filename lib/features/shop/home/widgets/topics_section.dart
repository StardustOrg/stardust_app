import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/section_title.dart';
import 'package:stardust_app_skeleton/common/widgets/star_tag.dart';
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
                  StarTag(topic: topic),
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
