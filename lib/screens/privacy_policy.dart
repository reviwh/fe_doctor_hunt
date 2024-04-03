import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
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
                  "Privacy and Policy",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.3,
                    color: darkCharcoal,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: Text(
                        "Doctor Hunt Apps Privacy Policy",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: -0.3,
                          color: slateGray,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: darkGray,
                        ),
                      ),
                    ),
                    _list(
                      "The standard chunk of lorem Ipsum used since 1500s is reproduced below for those interested.",
                    ),
                    _list(
                      "Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum. The point of using.",
                    ),
                    _list(
                      "Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.",
                    ),
                    _list(
                      "The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.",
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "It is a long established fact that reader distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: darkGray,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _list(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: green,
              ),
            ),
          ),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
