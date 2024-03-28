import 'package:doctor_hunt/screens/diagnostic_test.dart';
import 'package:doctor_hunt/screens/doctor.dart';
import 'package:doctor_hunt/screens/favorite_doctor.dart';
import 'package:doctor_hunt/screens/logout.dart';
import 'package:doctor_hunt/screens/medical_record.dart';
import 'package:doctor_hunt/screens/patient_details.dart';
import 'package:doctor_hunt/screens/popular_doctor.dart';
import 'package:doctor_hunt/screens/privacy_policy.dart';
import 'package:doctor_hunt/screens/profile.dart';
import 'package:doctor_hunt/screens/settings.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Hunt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        useMaterial3: true,
        fontFamily: "Rubik",
      ),
      home: const DoctorPage(),
    );
  }
}
