import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class CircularOptions extends StatelessWidget {
  final dynamic value;
  final String text;
  final bool isActive;
  final Function() onTap;

  const CircularOptions({
    super.key,
    this.value,
    this.text = "",
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: isActive ? green : green.withOpacity(.08),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
              fontSize: isActive ? 14 : 12,
              letterSpacing: -.3,
              color: isActive ? Colors.white : green,
            ),
          ),
        ),
      ),
    );
  }
}
