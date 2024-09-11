import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/features/home/screens/home.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({super.key});

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Center(
      child: Text(
        'Index 1: Business',
      ),
    ),
    Center(
      child: Text(
        'Index 2: School',
      ),
    ),
    Center(
      child: Text(
        'Index 3: Settings',
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              StarImages.homeSvg,
              colorFilter: ColorFilter.mode(
                StarColors.bgLight,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              StarImages.favoritesSvg,
              colorFilter: ColorFilter.mode(
                StarColors.bgLight,
                BlendMode.srcIn,
              ),
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              StarImages.messagesSvg,
              colorFilter: ColorFilter.mode(
                StarColors.bgLight,
                BlendMode.srcIn,
              ),
            ),
            label: 'Mensagens',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              StarImages.profileSvg,
              colorFilter: ColorFilter.mode(
                StarColors.bgLight,
                BlendMode.srcIn,
              ),
            ),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
