import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LiveCard extends StatelessWidget {
  final String image;
  final Function() onTap;

  const LiveCard({
    super.key,
    this.image = "",
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: 117,
              height: 168,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black.withOpacity(.2),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/icons/play.svg',
                height: 32,
                width: 32,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Image.asset(
                'assets/images/live.png',
                width: 40,
                height: 18,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}
