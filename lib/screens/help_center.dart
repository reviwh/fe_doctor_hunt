import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/form_field.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/bg.png',
          width: screen.width,
          height: screen.height,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Column(children: [
          const CustomAppBar(
            prefix: CustomBackButton(),
            title: Text(
              "Help Center",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: -0.3,
                color: darkCharcoal,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                  )
                ]),
            child: const CustomTextField(
              hintText: "I have an issue with",
              fontSize: 18,
              textColor: green,
              borderRadius: 4,
              borderWidth: 0,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildListItem("Booking a new Appointment"),
                _buildListItem("Existing Appointment"),
                _buildListItem("Online consultations"),
                _buildListItem("Feedbacks"),
                _buildListItem("Medicine orders"),
                _buildListItem("Diagnostic Tests"),
                _buildListItem("Health plans"),
                _buildListItem("My account and Practo Drive"),
                _buildListItem("Have a feature in mind"),
                _buildListItem("Other issues"),
              ],
            ),
          )
        ]))
      ]),
    );
  }

  Widget _buildListItem(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 18,
          letterSpacing: -0.3,
          color: slateGray,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: slateGray,
        size: 14,
      ),
    );
  }
}
