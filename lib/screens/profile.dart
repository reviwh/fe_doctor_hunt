import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/screens/profile_edit.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          Container(
            width: width,
            height: 357,
            decoration: const BoxDecoration(
              color: green,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const CustomAppBar(
                  prefix: CustomBackButton(),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -0.3,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 34),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Set up your profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.3,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Update your profile to connect your doctor with better impression.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: -0.3,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 138,
                  height: 130,
                  margin: const EdgeInsets.all(12),
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 13,
                        right: 0,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: slateGray.withOpacity(.8),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.photo_camera_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
                        child: Text(
                          "Personal information",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: -0.3,
                            color: darkCharcoal,
                          ),
                        ),
                      ),
                      _field(label: "Name", value: "Abdullah Mamun"),
                      _field(
                          label: "Contact Number",
                          value: "+8801800000000",
                          isEditable: true),
                      _field(
                          label: "Date of Birth",
                          value: "DD MM YYYY",
                          isEditable: true),
                      _field(label: "Location", value: "Add Details"),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
                  child: CustomPrimaryButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileEditPage()),
                      );
                    },
                    text: "Continue",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _field(
      {required String label, required String value, bool isEditable = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  letterSpacing: -0.3,
                  color: green,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  letterSpacing: -0.3,
                  color: slateGray,
                ),
              ),
            ],
          ),
          if (isEditable)
            InkWell(
              onTap: () {},
              child: const SizedBox(
                width: 18,
                height: 18,
                child: Icon(
                  Icons.edit_rounded,
                  color: slateGray,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
