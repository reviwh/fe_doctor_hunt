import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/screens/home.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class ThankYouDialog extends StatelessWidget {
  final String doctor, date, time;
  const ThankYouDialog({
    super.key,
    required this.doctor,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/thumb.png',
            width: 156,
            height: 156,
          ),
          const SizedBox(height: 12),
          const Text(
            'Thank You!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 36,
              letterSpacing: -.3,
              color: darkCharcoal,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Your Appointment Successful',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              letterSpacing: -.3,
              color: slateGray,
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'You booked an appointment with $doctor on $date, at $time',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: -.3,
                color: slateGray),
          ),
          const SizedBox(height: 28),
          CustomPrimaryButton(
            text: 'Done',
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            },
          ),
          CustomTextButton(
            text: 'Edit your appointment',
            fontSize: 14,
            color: slateGray,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
