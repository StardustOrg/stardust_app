import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/services/auth.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
    required Auth auth,
  }) : _auth = auth;

  final Auth _auth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: StarColors.bgLight,
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          top: BorderSide(width: 1, color: StarColors.starBlue),
          left: BorderSide(width: 1, color: StarColors.starBlue),
          bottom: BorderSide(width: 3, color: StarColors.starBlue),
          right: BorderSide(width: 3, color: StarColors.starBlue),
        ),
      ),
      child: Column(
        children: [
          ProfileOptionItem(
            onTap: () {
              StarLoggerHelper.debug('Meu álbum');
            },
            title: 'Meu álbum',
            icon: SvgPicture.asset('assets/icons/sticker.svg', width: 30),
          ),
          const OptionsDivider(),
          ProfileOptionItem(
            onTap: () {
              StarLoggerHelper.debug('Histórico');
            },
            title: 'Histórico',
            icon: const Icon(Icons.point_of_sale_rounded, size: 30),
          ),
          const OptionsDivider(),
          ProfileOptionItem(
            onTap: () {
              StarLoggerHelper.debug('Cartões');
            },
            title: 'Cartões',
            icon: const Icon(Icons.credit_card_rounded, size: 30),
          ),
          const OptionsDivider(),
          ProfileOptionItem(
            onTap: () {
              StarLoggerHelper.debug('Cupons');
            },
            title: 'Cupons',
            icon: SvgPicture.asset('assets/icons/cupons.svg', width: 30),
          ),
          const OptionsDivider(),
          ProfileOptionItem(
            onTap: () {
              StarLoggerHelper.debug('Configurações');
            },
            title: 'Configurações',
            icon: const Icon(Icons.settings_rounded, size: 30),
          ),
          const OptionsDivider(),
          ProfileOptionItem(
            onTap: () {
              StarLoggerHelper.debug('FAQ');
            },
            title: 'FAQ',
            icon: const Icon(Icons.help_rounded, size: 30),
          ),
          const OptionsDivider(),
          ProfileOptionItem(
            onTap: () {
              StarLoggerHelper.debug('Suporte');
            },
            title: 'Suporte',
            icon: const Icon(Icons.support_agent_rounded, size: 30),
          ),
          const OptionsDivider(),
          ProfileOptionItem(
            onTap: () {
              _auth.signOut();
              StarLoggerHelper.debug('Logout');
            },
            title: 'Logout',
            icon: const Icon(Icons.logout_rounded, size: 30),
          ),
        ],
      ),
    );
  }
}

class OptionsDivider extends StatelessWidget {
  const OptionsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
      ),
    );
  }
}

class ProfileOptionItem extends StatelessWidget {
  const ProfileOptionItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final void Function()? onTap;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.none,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 30),
              Text(
                title,
                style: const TextStyle(
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
    );
  }
}
