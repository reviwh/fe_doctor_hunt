import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/test_card.dart';
import 'package:doctor_hunt/screens/patient_details.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
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
                    GridView.count(
                      shrinkWrap: true,
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
                    ListView.separated(
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
                          regularPrice: diagnosticTests[index]['regularPrice'],
                          discountPrice: diagnosticTests[index]
                              ['discountPrice'],
                          discount: diagnosticTests[index]['discount'],
                          additional: diagnosticTests[index]['additional'],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PatientDetailsPage()),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 14),
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
              Container(
                width: 49.56,
                height: 52.94,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color1,
                      color2,
                    ],
                  ),
                ),
                child: Center(
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
              Positioned(
                top: 0,
                left: 34.5,
                child: Container(
                  width: 41.5,
                  height: 39.41,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(.06),
                  ),
                ),
              ),
              Positioned(
                top: 22.94,
                left: 6,
                child: Container(
                  width: 49.59,
                  height: 47.06,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(.04),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
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
