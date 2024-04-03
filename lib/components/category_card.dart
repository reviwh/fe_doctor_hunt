import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final double rating;
  final int views;
  final bool isFavorited;
  final Function()? onTap;

  const CategoryCard({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    this.rating = 0.0,
    this.views = 0,
    this.isFavorited = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(.08),
          blurRadius: 20,
        )
      ]),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.transparent,
          borderOnForeground: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Container(
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
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
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              letterSpacing: -0.3,
                              color: slateGray,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/icons/stars.png',
                                width: 80,
                                height: 12,
                                fit: BoxFit.contain,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: rating.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: -0.3,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " (",
                                      style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        letterSpacing: -0.3,
                                        color: slateGray,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "$views views",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        letterSpacing: -0.3,
                                        color: slateGray,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ")",
                                      style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        letterSpacing: -0.3,
                                        color: slateGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        top: 16,
                        right: 0,
                        child: isFavorited
                            ? SvgPicture.asset(
                                'assets/icons/favorite.svg',
                                width: 19,
                                height: 17,
                                colorFilter:
                                    const ColorFilter.mode(red, BlendMode.srcIn),
                              )
                            : SvgPicture.asset(
                                'assets/icons/favorite_border_thin.svg',
                                width: 19,
                                height: 17,
                                colorFilter:
                                    const ColorFilter.mode(gray, BlendMode.srcIn),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
