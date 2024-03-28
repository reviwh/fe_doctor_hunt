import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/bottom_navbar.dart';
import 'package:doctor_hunt/components/category_card.dart';
import 'package:doctor_hunt/components/search_field.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  TextEditingController searchController = TextEditingController();

  int selectedTab = 0;

  List<Map<String, dynamic>> doctors = [
    {
      "images": "assets/images/doc-6.jpg",
      "name": "Dr. Pediatrician",
      "speciality": "Specialist Cardiologist",
      "rating": 2.8,
      "views": 2821,
      "isFavorited": true,
    },
    {
      "images": "assets/images/doc-5.jpg",
      "name": "Dr. Mistry Brick",
      "speciality": "Specialist Dentist",
      "rating": 2.8,
      "views": 2821,
      "isFavorited": true,
    },
    {
      "images": "assets/images/doc-4.jpg",
      "name": "Dr. Ether Wall",
      "speciality": "Specialist Cancer",
      "rating": 2.8,
      "views": 2821,
      "isFavorited": true,
    },
    {
      "images": "assets/images/doc-8.jpg",
      "name": "Dr. Johan Smith",
      "speciality": "Specialist Cardiologist",
      "rating": 2.8,
      "views": 2821,
      "isFavorited": true,
    },
    {
      "images": "assets/images/doc-8.jpg",
      "name": "Dr. Johan Smith",
      "speciality": "Specialist Cardiologist",
      "rating": 2.8,
      "views": 2821,
      "isFavorited": true,
    },
    {
      "images": "assets/images/doc-4.jpg",
      "name": "Dr. Ether Wall",
      "speciality": "Specialist Cancer",
      "rating": 2.8,
      "views": 2821,
      "isFavorited": true,
    },
  ];

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
                  "Doctors",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.3,
                    color: darkCharcoal,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SearchField(controller: searchController, onSubmit: () {}),
              SizedBox(
                height: 76,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _tabs(
                        title: "All",
                        isSelected: selectedTab == 0,
                        onTap: () {
                          setState(() {
                            selectedTab = 0;
                          });
                        }),
                    const SizedBox(width: 10),
                    _tabs(
                        title: "Dentist",
                        isSelected: selectedTab == 1,
                        onTap: () {
                          setState(() {
                            selectedTab = 1;
                          });
                        }),
                    const SizedBox(width: 10),
                    _tabs(
                        title: "Cardiologist",
                        isSelected: selectedTab == 2,
                        onTap: () {
                          setState(() {
                            selectedTab = 2;
                          });
                        }),
                    const SizedBox(width: 10),
                    _tabs(
                        title: "Physiotherapist",
                        isSelected: selectedTab == 3,
                        onTap: () {
                          setState(() {
                            selectedTab = 3;
                          });
                        }),
                    const SizedBox(width: 10),
                    _tabs(
                        title: "Cancer",
                        isSelected: selectedTab == 4,
                        onTap: () {
                          setState(() {
                            selectedTab = 4;
                          });
                        }),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 128 * doctors.length + 2,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        image: doctors[index]['images'],
                        name: doctors[index]['name'],
                        speciality: doctors[index]['speciality'],
                        rating: doctors[index]['rating'],
                        views: doctors[index]['views'],
                        isFavorited: doctors[index]['isFavorited'],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 14),
                  ),
                ),
              ),
              const SizedBox(height: 74),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          child: BottomNavbar(),
        )
      ],
    ));
  }

  Widget _tabs({
    required String title,
    required bool isSelected,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? green : green.withOpacity(.08),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
              fontSize: 14,
              letterSpacing: -0.3,
              color: isSelected ? Colors.white : green,
            ),
          ),
        ),
      ),
    );
  }
}
