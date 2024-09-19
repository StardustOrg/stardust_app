import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artists/artist_cont.dart';
import 'package:stardust_app_skeleton/common/widgets/section_title.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/screens/artist_page.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class ArtistsRowList extends StatelessWidget {
  final String? title;
  final List<Artist> artists;

  const ArtistsRowList({
    super.key,
    this.title,
    required this.artists,
    this.detailColor = StarColors.starPink,
    this.goToArtistPage = true,
    required this.onArtistContainerPress,
  });

  final Color detailColor;
  final bool goToArtistPage;
  final void Function(Artist) onArtistContainerPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          SectionTitle(
            title: title!,
            color: detailColor,
          ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: artists.asMap().entries.map((entry) {
              final index = entry.key;
              final artist = entry.value;
              return Row(
                children: [
                  ArtistContainer(
                    artist: artist,
                    borderColor: index.isEven
                        ? StarColors.starPink
                        : StarColors.starBlue,
                    onPressed: () {
                      if (goToArtistPage) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ArtistPage(id: artist.id);
                          }),
                        );
                      } else {
                        onArtistContainerPress(artist);
                      }
                    },
                  ),
                  if (index != artists.length - 1) const SizedBox(width: 15),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
