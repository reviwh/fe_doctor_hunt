import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/screens/diagnostic_book.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class DiagnosticTestPage extends StatefulWidget {
  const DiagnosticTestPage({super.key});

  @override
  State<DiagnosticTestPage> createState() => _DiagnosticTestPageState();
}

class _DiagnosticTestPageState extends State<DiagnosticTestPage> {
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
                  "Diagnostics Tests",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.3,
                    color: darkCharcoal,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/diagnostics-tests.png',
                      width: 214,
                      height: 214,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "You haven’t booked any tests yet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          letterSpacing: -0.3,
                          color: darkCharcoal,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
                      child: Text(
                        "Get started with your first health checkup.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: -0.3,
                          color: slateGray,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: SizedBox(
                          width: 270,
                          child: CustomPrimaryButton(
                            text: "Book Now",
                            fontSize: 14,
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const DiagnosticBookPage()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
