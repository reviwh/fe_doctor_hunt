import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/doctor_book_card.dart';
import 'package:doctor_hunt/components/search_field.dart';
import 'package:doctor_hunt/screens/select_time.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';

class FindDoctorPage extends StatefulWidget {
  const FindDoctorPage({super.key});

  @override
  State<FindDoctorPage> createState() => _FindDoctorPageState();
}

class _FindDoctorPageState extends State<FindDoctorPage> {
  final TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            width: screen.width,
            height: screen.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                const CustomAppBar(
                  prefix: CustomBackButton(),
                  title: Text(
                    "Find Doctors",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -0.3,
                      color: darkCharcoal,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SearchField(controller: _controller, onSubmit: (value) {}),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) {
                      final doctor = findDoctors[index];
                      return DoctorBookCard(
                        name: doctor['name'] ?? '',
                        speciality: doctor['speciality'] ?? '',
                        image: doctor['image'] ?? '',
                        exp: doctor['exp'] ?? 0,
                        percentage: doctor['percentage'] ?? 0,
                        patientStories: doctor['patientStroies'] ?? 0,
                        nextAvailable: doctor['nextAvailable'] ?? '',
                        isFavorite: doctor['isFavorite'] ?? false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectTimePage(),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: findDoctors.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
