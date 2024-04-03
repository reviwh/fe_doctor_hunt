import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;

  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 22,
            )
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icon,
                width: 18,
                height: 18,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  letterSpacing: -0.3,
                  color: slateGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
