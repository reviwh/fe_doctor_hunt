import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorBookCard extends StatelessWidget {
  final String name;
  final String speciality;
  final String image;
  final int exp;
  final int percentage;
  final int patientStories;
  final String nextAvailable;
  final bool isFavorite;
  final Function() onTap;

  const DoctorBookCard({
    super.key,
    required this.name,
    required this.speciality,
    required this.image,
    required this.exp,
    required this.percentage,
    required this.patientStories,
    required this.nextAvailable,
    this.isFavorite = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<String> nextAvailableArray = nextAvailable.split(' ');

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 20,
          )
        ],
      ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 92,
                    height: 87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                letterSpacing: -0.3,
                                color: darkCharcoal,
                              ),
                            ),
                            Text(
                              speciality,
                              style: GoogleFonts.ptSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: -0.3,
                                color: green,
                              ),
                            ),
                            Text(
                              "$exp Years of Experience",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                letterSpacing: -0.3,
                                color: slateGray,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: green,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "$percentage%",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    letterSpacing: -0.3,
                                    color: slateGray,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: green,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "$patientStories Patient Stories",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    letterSpacing: -0.3,
                                    color: slateGray,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: isFavorite
                              ? SvgPicture.asset(
                                  'assets/icons/favorite.svg',
                                  width: 19,
                                  height: 17,
                                  colorFilter: const ColorFilter.mode(
                                      red, BlendMode.srcIn),
                                )
                              : SvgPicture.asset(
                                  'assets/icons/favorite_border_thin.svg',
                                  width: 19,
                                  height: 17,
                                  colorFilter: const ColorFilter.mode(
                                      gray, BlendMode.srcIn),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Next Available",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: -0.3,
                          color: green,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text.rich(
                        TextSpan(
                          text: "${nextAvailableArray[0]} ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: -0.3,
                            color: slateGray,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "${nextAvailableArray[1]} ${nextAvailableArray[2]}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                letterSpacing: -0.3,
                                color: slateGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomPrimaryButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    text: "Book Now",
                    fontSize: 12,
                    borderRadius: 4,
                    onTap: onTap,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
