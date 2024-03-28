import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  const BottomNavbar({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          height: 74,
          width: MediaQuery.of(context).size.width,
          padding:
                const EdgeInsets.symmetric(horizontal: 44.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(.25),
                  blurRadius: 180,
                )
              ]),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomNavbarIcon(0, 'assets/icons/home.svg'),
                bottomNavbarIcon(1, 'assets/icons/favorite.svg'),
                bottomNavbarIcon(2, 'assets/icons/book.svg'),
                bottomNavbarIcon(3, 'assets/icons/chat.svg'),
              ],
            ),
          )),
    );
  }

  Widget bottomNavbarIcon(int index, String icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: index == currentIndex ? green : Colors.transparent,
        borderRadius: BorderRadius.circular(48.0),
      ),
      child: Center(
          child: SvgPicture.asset(
        icon,
        height: 20,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(
          index == currentIndex ? Colors.white : coolGray,
          BlendMode.srcIn,
        ),
      )),
    );
  }
}
