import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artists/artist_cont.dart';
import 'package:stardust_app_skeleton/common/widgets/section_title.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/screens/artist_page.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class ArtistWrapList extends StatelessWidget {
  final String title;
  final List<Artist> artists;
  final Color color;

  const ArtistWrapList({
    super.key,
    required this.title,
    required this.artists,
    this.color = StarColors.starBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title, color: color),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: artists.length,
            itemBuilder: (context, index) {
              final artist = artists[index];
              return ArtistContainer(
                  artist: artist,
                  borderColor:
                      index.isEven ? StarColors.starPink : StarColors.starBlue,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ArtistPage(id: artist.id);
                      }),
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
