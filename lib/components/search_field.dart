import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function() onSubmit;
  const SearchField({
    super.key,
    this.hint = "Search",
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: TextField(
          controller: controller,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            letterSpacing: -0.3,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              letterSpacing: -0.3,
              color: slateGray,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 12, 20),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 13,
                height: 13,
                colorFilter: const ColorFilter.mode(slateGray, BlendMode.srcIn),
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.text = "";
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 20, 20),
                child: SvgPicture.asset(
                  'assets/icons/x.svg',
                  width: 11,
                  height: 11,
                  colorFilter:
                      const ColorFilter.mode(slateGray, BlendMode.srcIn),
                ),
              ),
            ),
          )),
    );
  }
}
