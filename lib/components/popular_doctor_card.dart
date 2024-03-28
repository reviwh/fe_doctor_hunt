import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class PopularDoctorCard extends StatelessWidget {
  final String images;
  final String name;
  final String speciality;
  const PopularDoctorCard({
    super.key,
    required this.images,
    required this.name,
    required this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 200,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(.08),
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
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide.none,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 136,
              height: 131,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                  bottom: Radius.circular(2),
                ),
                image: DecorationImage(
                  image: AssetImage(images),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      letterSpacing: -0.3,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    speciality,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      letterSpacing: -0.3,
                      color: slateGray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 68,
                    height: 10.2,
                    child: Image.asset(
                      'assets/icons/stars.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
