import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artist_cont.dart';
import 'package:stardust_app_skeleton/models/artist.dart';

class ArtistWrapList extends StatelessWidget {
  final String title;
  final List<Artist> artists;

  const ArtistWrapList({
    super.key,
    required this.title,
    required this.artists,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
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
                artistName: artist.name,
              );
            },
          ),
        ),
      ],
    );
  }
}
