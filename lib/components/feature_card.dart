import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class FeatureCard extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final double rating;
  final bool isFavorited;
  final Function()? onTap;
  const FeatureCard({
    super.key,
    required this.image,
    required this.name,
    this.price = 0.0,
    this.rating = 0.0,
    this.isFavorited = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 130,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.06),
          blurRadius: 20,
        )
      ]),
      child: GestureDetector(
        onTap: onTap,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                      height: 10,
                      child: Center(
                        child: isFavorited
                            ? SvgPicture.asset(
                                'assets/icons/favorite.svg',
                                colorFilter: const ColorFilter.mode(
                                    red, BlendMode.srcIn),
                              )
                            : SvgPicture.asset(
                                'assets/icons/favorite_border_thin.svg',
                                colorFilter: const ColorFilter.mode(
                                    shadowBlue, BlendMode.srcIn),
                              ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                          height: 10,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/star.svg',
                              colorFilter: const ColorFilter.mode(
                                  crayola, BlendMode.srcIn),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          NumberFormat("#.0", "en_US").format(rating),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            letterSpacing: -0.3,
                            height: .9,
                            color: darkCharcoal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  letterSpacing: -0.3,
                  color: darkCharcoal,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "\$ ",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 9,
                    letterSpacing: -0.3,
                    color: green,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "${NumberFormat("#.00", "en_US").format(price)}/hour",
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 9,
                        letterSpacing: -0.3,
                        color: shadowBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
