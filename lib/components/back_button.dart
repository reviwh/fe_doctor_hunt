import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onTap;
  const CustomBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          onTap: onTap ??
              () {
                Navigator.pop(context);
              },
          borderRadius: BorderRadius.circular(10.0),
          child: Center(
              child: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
            width: 7,
            height: 13,
            colorFilter: const ColorFilter.mode(slateGray, BlendMode.srcIn),
          )),
        ),
      ),
    );
  }
}
