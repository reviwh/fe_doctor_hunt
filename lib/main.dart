import 'package:doctor_hunt/screens/splash_screen.dart';
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
      home: const SplashScreen(),
    );
  }
}
