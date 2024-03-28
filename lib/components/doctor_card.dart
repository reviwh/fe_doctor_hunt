import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final bool isFavorited;

  const DoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    this.isFavorited = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 180,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(.06),
          blurRadius: 20,
        )
      ]),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.transparent,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide.none,
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: -0.3,
                        color: darkCharcoal,
                      ),
                    ),
                    Text(
                      speciality,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: -0.3,
                        color: green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: isFavorited
                  ? SvgPicture.asset(
                      'assets/icons/favorite.svg',
                      width: 19,
                      height: 17,
                      colorFilter: const ColorFilter.mode(red, BlendMode.srcIn),
                    )
                  : SvgPicture.asset(
                      'assets/icons/favorite_border_thin.svg',
                      width: 19,
                      height: 17,
                      colorFilter:
                          const ColorFilter.mode(silver, BlendMode.srcIn),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
