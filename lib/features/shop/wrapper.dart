import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/features/shop/home/screens/home.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/features/shop/profile/screens/profile_screen.dart';
import 'package:stardust_app_skeleton/models/user.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({super.key, required this.user});
  final UserApp user;

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const Home(),
      const Center(
        child: Text(
          'Index 1: Favoritos',
        ),
      ),
      const Center(
        child: Text(
          'Index 2: Menssagens',
        ),
      ),
      ProfileScreen(uid: widget.user.uid),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    StarLoggerHelper.info('User: ${widget.user.uid}');
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            height: 71,
            indicatorColor: StarColors.starBlue.withOpacity(0.5),
            elevation: 0,
            backgroundColor: StarColors.starPink,
            labelTextStyle: const WidgetStatePropertyAll(
              TextStyle(
                color: StarColors.bgLight,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: NavigationBar(
            destinations: <NavigationDestination>[
              NavigationDestination(
                icon: SvgPicture.asset(
                  StarImages.homeSvg,
                  colorFilter: const ColorFilter.mode(
                    StarColors.bgLight,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  StarImages.favoritesSvg,
                  colorFilter: const ColorFilter.mode(
                    StarColors.bgLight,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Favoritos',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  StarImages.messagesSvg,
                  colorFilter: const ColorFilter.mode(
                    StarColors.bgLight,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Mensagens',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  StarImages.profileSvg,
                  colorFilter: const ColorFilter.mode(
                    StarColors.bgLight,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Perfil',
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
