import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/screens/add_record.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalRecordPage extends StatefulWidget {
  const MedicalRecordPage({super.key});

  @override
  State<MedicalRecordPage> createState() => _MedicalRecordPageState();
}

class _MedicalRecordPageState extends State<MedicalRecordPage> {
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
                  "Medical Record",
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
                      'assets/images/medical-record.png',
                      width: 214,
                      height: 214,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Add a medical record.",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        letterSpacing: -0.3,
                        color: darkCharcoal,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
                      child: Text(
                        "A detailed health history helps a doctor diagnose you better.",
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 52, vertical: 20),
                      child: CustomPrimaryButton(
                        text: "Add a record",
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            useSafeArea: true,
                            constraints: const BoxConstraints(maxHeight: 250),
                            context: context,
                            builder: ((context) => _bottomSheet()),
                          );
                        },
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

  Widget _bottomSheet() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: 130,
              height: 5,
              color: silver,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Add a record",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                letterSpacing: -0.3,
                color: darkCharcoal,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                leading: SvgPicture.asset(
                  'assets/icons/camera.svg',
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                  colorFilter:
                      const ColorFilter.mode(slateGray, BlendMode.srcIn),
                ),
                title: const Text(
                  "Take a photo",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: -0.3,
                    color: slateGray,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddRecordPage()),
                  );
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                leading: SvgPicture.asset(
                  'assets/icons/photo.svg',
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                  colorFilter:
                      const ColorFilter.mode(slateGray, BlendMode.srcIn),
                ),
                title: const Text(
                  "Upload from gallery",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: -0.3,
                    color: slateGray,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddRecordPage()),
                  );
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                leading: SvgPicture.asset(
                  'assets/icons/pdf.svg',
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                  colorFilter:
                      const ColorFilter.mode(slateGray, BlendMode.srcIn),
                ),
                title: const Text(
                  "Upload files",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: -0.3,
                    color: slateGray,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddRecordPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
