import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocard_cont.dart';
import 'package:stardust_app_skeleton/repository/photocards_repository.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';
import 'package:stardust_app_skeleton/utils/local_storage/favorite_utils.dart';
import 'package:stardust_app_skeleton/models/photocard.dart'; // Ensure you have the Photocard model

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Photocard>> _favoritesFuture;

  Future<List<Photocard>> _fetchFavorites() async {
    // Replace this with actual retrieval of favorite IDs and then fetch Photocard details
    List<String> favoriteIds = await FavoritesUtils.getFavorites();
    return await PhotocardsRepository.instance
        .getPhotocardsByIds(favoriteIds); // Modify as needed
  }

  @override
  void initState() {
    super.initState();
    _favoritesFuture = _fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                child: Row(
                  children: [
                    const Text(
                      'SEUS FAVORITOS',
                      style: TextStyle(
                        color: StarColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      StarImages.sparkles,
                      width: 25,
                      colorFilter: const ColorFilter.mode(
                        StarColors.starPink,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              FutureBuilder<List<Photocard>>(
                future: _favoritesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No favorites found'));
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
