import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/test_card.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiagnosticBookPage extends StatefulWidget {
  const DiagnosticBookPage({super.key});

  @override
  State<DiagnosticBookPage> createState() => _DiagnosticBookPageState();
}

class _DiagnosticBookPageState extends State<DiagnosticBookPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Map<String, dynamic>> diagnosticTests = [
      {
        "title": "Advanced Young Indian Health Checkup",
        "subtitle": "Ideal for individuals aged 21-40 years",
        "numsOfTest": 69,
        "image": 'assets/images/test-1.jpg',
        "regularPrice": 358,
        "discountPrice": 330,
        "discount": 35,
        "additional": "+ 10% Health cashback T&C"
      },
      {
        "title": "Working Women's Health Checkup",
        "subtitle": "Ideal for individuals aged 21-40 years",
        "numsOfTest": 119,
        "image": 'assets/images/test-2.jpg',
        "regularPrice": 387,
        "discountPrice": 345,
        "discount": 35,
        "additional": "+ 10% Health cashback T&C"
      },
      {
        "title": "Active Professional Health Checkup",
        "subtitle": "Ideal for individuals aged 21-40 years",
        "numsOfTest": 100,
        "image": 'assets/images/test-3.jpg',
        "regularPrice": 457,
        "discountPrice": 411,
        "discount": 35,
        "additional": "+ 10% Health cashback T&C"
      },
    ];

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/bg.png',
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                prefix: CustomBackButton(),
                title: Text(
                  "Diagnostic Tests",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.3,
                    color: darkCharcoal,
                  ),
                ),
              ),
              const SizedBox(height: 23),
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Get Full body health checkups from the comfort of your home.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          letterSpacing: -0.3,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Up to 45% off + get 10% health cashback",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            letterSpacing: -0.3,
                            color: green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 52.94 * 2 + 75,
                      child: GridView.count(
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 163 / 52.94,
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 35,
                        children: [
                          _gridItem(
                            palatinateBlue,
                            violet,
                            'assets/icons/home.svg',
                            'Free home \nSample pickup',
                          ),
                          _gridItem(
                            sunburnt,
                            pastelRed,
                            'assets/icons/practo.svg',
                            'Practo \nasociate labs',
                          ),
                          _gridItem(
                            mango,
                            crayola,
                            'assets/icons/e-report.svg',
                            'E-Reports in \n24-72 hours',
                          ),
                          _gridItem(
                            green,
                            caribbeanGreen,
                            'assets/icons/follow-up.svg',
                            'Free follow-up \nwith a doctor',
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 3),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recommend for you",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            letterSpacing: -0.3,
                            color: darkCharcoal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 450.0 * diagnosticTests.length + 18,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        itemCount: diagnosticTests.length,
                        itemBuilder: (context, index) {
                          return TestCard(
                            title: diagnosticTests[index]['title'],
                            subtitle: diagnosticTests[index]['subtitle'],
                            numsOfTest: diagnosticTests[index]['numsOfTest'],
                            image: diagnosticTests[index]['image'],
                            regularPrice: diagnosticTests[index]
                                ['regularPrice'],
                            discountPrice: diagnosticTests[index]
                                ['discountPrice'],
                            discount: diagnosticTests[index]['discount'],
                            additional: diagnosticTests[index]['additional'],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _gridItem(Color color1, Color color2, String icon, String text) {
    return SizedBox(
      width: 163,
      height: 52.94,
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 49.56,
                  height: 52.94,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          color1,
                          color2,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 16,
                      ),
                      child: SvgPicture.asset(
                        icon,
                        fit: BoxFit.contain,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 34.5,
                child: ClipOval(
                  child: Container(
                    width: 41.5,
                    height: 39.41,
                    color: Colors.white.withOpacity(.06),
                  ),
                ),
              ),
              Positioned(
                top: 22.94,
                left: 6,
                child: ClipOval(
                  child: Container(
                    width: 49.59,
                    height: 47.06,
                    color: Colors.white.withOpacity(.04),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 9),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: -0.3,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
