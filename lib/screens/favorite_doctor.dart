import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/bottom_navbar.dart';
import 'package:doctor_hunt/components/doctor_card.dart';
import 'package:doctor_hunt/components/feature_card.dart';
import 'package:doctor_hunt/components/search_field.dart';
import 'package:doctor_hunt/components/section_header.dart';
import 'package:doctor_hunt/screens/doctor.dart';
import 'package:doctor_hunt/screens/doctor_details.dart';
import 'package:doctor_hunt/screens/find_doctor.dart';
import 'package:doctor_hunt/screens/home.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';

class FavoriteDoctorPage extends StatefulWidget {
  const FavoriteDoctorPage({super.key});

  @override
  State<FavoriteDoctorPage> createState() => _FavoriteDoctorPageState();
}

class _FavoriteDoctorPageState extends State<FavoriteDoctorPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

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
              CustomAppBar(
                prefix: CustomBackButton(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false,
                    );
                  },
                ),
                title: const Text(
                  "Favourite Doctors",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.3,
                    color: darkCharcoal,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SearchField(
                hint: "Dentist",
                controller: searchController,
                onSubmit: (value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindDoctorPage()));
                },
              ),
              Expanded(
                child: ListView(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 212,
                      ),
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          image: doctorsInGrid[index]['images'],
                          name: doctorsInGrid[index]['name'],
                          speciality: doctorsInGrid[index]['speciality'],
                          isFavorited: doctorsInGrid[index]['isFavourite'],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DoctorDetailPage()));
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    SectionHeader(
                      title: "Feature Doctor",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DoctorPage()));
                      },
                    ),
                    SizedBox(
                      height: 185,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(20),
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredDoctors.length,
                        itemBuilder: (context, index) {
                          return FeatureCard(
                            image: featuredDoctors[index]['images'],
                            name: featuredDoctors[index]['name'],
                            rating: featuredDoctors[index]['rating'],
                            price: featuredDoctors[index]['price'],
                            isFavorited: featuredDoctors[index]['isFavorited'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DoctorDetailPage()));
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                      ),
                    ),
                    const SizedBox(height: 64),
                  ],
                ),
              ),
            ],
          )),
          const Positioned(bottom: 0, child: BottomNavbar(currentIndex: 1)),
        ],
      ),
    );
  }
}
