import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool isMore;
  final Function()? onTap;
  
  const SectionHeader({
    super.key,
    this.title = "",
    this.isMore = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              letterSpacing: -0.3,
              color: darkCharcoal,
            ),
          ),
          if (isMore)
            Row(children: [
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "See all",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    letterSpacing: -0.3,
                    color: slateGray,
                  ),
                ),
              ),
              const SizedBox(width: 2.54),
              SvgPicture.asset(
                'assets/icons/arrow_right.svg',
                width: 4,
                height: 7,
                theme: const SvgTheme(currentColor: slateGray),
              ),
            ])
        ],
      ),
    );
  }
}
