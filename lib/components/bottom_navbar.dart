import 'package:doctor_hunt/screens/favorite_doctor.dart';
import 'package:doctor_hunt/screens/home.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 44.0),
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
                _bottomNavbarIcon(
                  index: 0,
                  icon: 'assets/icons/home.svg',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false,
                    );
                  },
                ),
                _bottomNavbarIcon(
                  index: 1,
                  icon: 'assets/icons/favorite.svg',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoriteDoctorPage()),
                      (route) => false,
                    );
                  },
                ),
                _bottomNavbarIcon(
                  index: 2,
                  icon: 'assets/icons/book.svg',
                  onTap: () {},
                ),
                _bottomNavbarIcon(
                  index: 3,
                  icon: 'assets/icons/chat.svg',
                  onTap: () {},
                ),
              ],
            ),
          )),
    );
  }

  Widget _bottomNavbarIcon(
      {required int index, required String icon, required Function() onTap}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: index == currentIndex ? green : Colors.transparent,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.0),
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: 20,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              index == currentIndex ? Colors.white : coolGray,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
