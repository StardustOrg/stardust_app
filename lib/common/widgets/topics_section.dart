import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/section_title.dart';
import 'package:stardust_app_skeleton/common/widgets/star_tag.dart';
import 'package:stardust_app_skeleton/models/star_tag.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class TopicsSection extends StatelessWidget {
  const TopicsSection({
    super.key,
    required this.topics,
    required this.title,
  });

  final String title;
  final List<Tag> topics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: title,
          color: StarColors.starPink,
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: topics.map((topic) {
              return Row(
                children: [
                  StarTag(topic: {'name': topic.label, 'id': topic.id}),
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
