import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final Function() onTap;

  const CustomPrimaryButton({
    super.key,
    this.text = "",
    this.fontSize = 18,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.0),
          child: Padding(
            padding: padding,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: fontSize,
                letterSpacing: -0.3,
                color: Colors.white,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final Function() onTap;

  const CustomOutlinedButton({
    super.key,
    this.text = "",
    this.fontSize = 18,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: green, width: .8),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.0),
          child: Padding(
            padding: padding,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: fontSize,
                letterSpacing: -0.3,
                color: green,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final Function() onTap;

  const CustomTextButton({
    super.key,
    this.text = "",
    this.fontSize = 18,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.0),
        child: Padding(
          padding: padding,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: fontSize,
              letterSpacing: -0.3,
              color: green,
            ),
          )),
        ),
      ),
    );
  }
}
