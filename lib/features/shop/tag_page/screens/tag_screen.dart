import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/common/widgets/artist_card.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocard_cont.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/models/star_tag.dart';
import 'package:stardust_app_skeleton/repository/photocards_repository.dart';
import 'package:stardust_app_skeleton/repository/tags_repository.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({super.key, required this.tagId});

  final String tagId;

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  late Future<List<Photocard>> _photocardsFuture;
  final PhotocardsRepository _photocardRepository =
      PhotocardsRepository.instance;

  late Future<Tag> _tagFuture;
  final TagsRepository _tagsRepository = TagsRepository.instance;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _tagFuture = _fetchTag();
      _photocardsFuture = _fetchPhotocards();
    });
  }

  Future<Tag> _fetchTag() async {
    return await _tagsRepository.getTagById(widget.tagId);
  }

  Future<List<Photocard>> _fetchPhotocards() async {
    List<Photocard> allPhotocards =
        await _photocardRepository.getPhotocardsByTag(widget.tagId);
    return allPhotocards;
  }

  @override
  Widget build(BuildContext context) {
    StarLoggerHelper.debug('TagScreen ${widget.tagId}');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: StarBackButton(),
              ),
              const SizedBox(height: 15),
              FutureBuilder<Tag>(
                future: _tagFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final tag = snapshot.data!;
                  return Column(
                    children: [
                      ArtistCard(imageUrl: tag.cover),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tag.label,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                            StarImages.sparkles,
                            colorFilter: const ColorFilter.mode(
                              StarColors.starPink,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),
              FutureBuilder<List<Photocard>>(
                future: _photocardsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No photocards found'));
                  } else {
                    final photocards = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        children: photocards.map((photocard) {
                          return Center(
                            child: PhotocardContainer(
                              artistName: photocard.artistName,
                              pcName: photocard.pcName,
                              id: photocard.id,
                              price: photocard.price,
                              size: StarDeviceUtils.getScreenWidth(context) *
                                  0.41,
                              imageUrl: photocard.imageUrl,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
