import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingSlider extends StatelessWidget {
  final String image, title, description;
  final bool isLeft;

  const OnBoardingSlider({
    super.key,
    this.image = "",
    this.title = "",
    this.description = "",
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -10,
          left: isLeft ? -108 : null,
          right: isLeft ? null : -108,
          child: Container(
            width: 342,
            height: 342,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(342),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [green, caribbeanGreen],
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 336,
              height: 336,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(336),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )
              ),
            ),
            const SizedBox(height: 84),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 28,
                letterSpacing: -.3,
                color: darkCharcoal,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: -.3,
                  color: slateGray,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ],
    );
  }
}
