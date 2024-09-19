import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/images/store_image.dart';
import 'package:stardust_app_skeleton/common/widgets/star_tag.dart';
import 'package:stardust_app_skeleton/models/user.dart';
import 'package:stardust_app_skeleton/repository/user_repository.dart';
import 'package:stardust_app_skeleton/services/auth.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.uid});

  final String uid;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StarUser>(
      stream: UserRepository().getUser(widget.uid),
      builder: (context, snapshot) {
        StarLoggerHelper.debug('User Profile: ${widget.uid}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          StarLoggerHelper.error(
              'Error loading user profile: ${snapshot.error}');
          return const Center(child: Text('Error loading profile'));
        } else if (snapshot.hasData) {
          StarUser user = snapshot.data!;
          StarLoggerHelper.debug('User data: ${user.toString()}');
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Image.network(
                          user.cover!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            color: StarColors.bgLight,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StarStoreImage(
                              imageUrl: user.icon!,
                              size: 100,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.username,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  width:
                                      StarDeviceUtils.getScreenWidth(context) *
                                          0.5,
                                  child: const Wrap(
                                    spacing: 8.0,
                                    runSpacing: 10.0,
                                    children: [
                                      StarTag(topic: "GG Stan"),
                                      StarTag(topic: "My"),
                                      StarTag(topic: "Midzy"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: StarColors.bgLight,
                            borderRadius: BorderRadius.circular(20),
                            border: const Border(
                              top: BorderSide(
                                  width: 1, color: StarColors.starBlue),
                              left: BorderSide(
                                  width: 1, color: StarColors.starBlue),
                              bottom: BorderSide(
                                  width: 3, color: StarColors.starBlue),
                              right: BorderSide(
                                  width: 3, color: StarColors.starBlue),
                            ),
                          ),
                          child: Column(
                            children: [
                              Material(
                                color: Colors.transparent,
                                clipBehavior: Clip.none,
                                borderRadius: BorderRadius.circular(5),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(5),
                                  onTap: () {
                                    _auth.signOut();
                                    StarLoggerHelper.debug('Logout');
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.logout_rounded,
                                          size: 30,
                                        ),
                                        SizedBox(width: 30),
                                        Text(
                                          'Logout',
                                          style: TextStyle(
                                            color: StarColors.textPrimary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          StarLoggerHelper.error(
              'Unexpected state: ${snapshot.connectionState}');
          return Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}
