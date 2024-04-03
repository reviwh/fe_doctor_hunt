import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int numsOfTest;
  final String image;
  final int regularPrice;
  final int discountPrice;
  final int discount;
  final String additional;
  final Function() onTap;

  const TestCard({
    super.key,
    this.title = "",
    this.subtitle = "",
    this.numsOfTest = 0,
    this.image = "",
    this.regularPrice = 0,
    this.discountPrice = 0,
    this.discount = 0,
    this.additional = "",
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 436,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 20,
          )
        ]),
        child: Card(
          semanticContainer: true,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(19, 12, 18, 18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.3,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          letterSpacing: -0.3,
                          color: slateGray,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        CustomOutlinedButton(
                          text: "$numsOfTest tests included",
                          fontSize: 12,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          onTap: () {},
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 11, 20, 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "\$ $regularPrice ",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "\$ $discountPrice ",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: slateGray,
                            ),
                          ),
                          TextSpan(
                            text: "$discount% off \n",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: green,
                            ),
                          ),
                          TextSpan(
                            text: additional,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: slateGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: CustomPrimaryButton(
                        text: "Book Now",
                        fontSize: 12,
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        onTap: onTap,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
