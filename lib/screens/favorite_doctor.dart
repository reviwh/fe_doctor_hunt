import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/bottom_navbar.dart';
import 'package:doctor_hunt/components/doctor_card.dart';
import 'package:doctor_hunt/components/feature_card.dart';
import 'package:doctor_hunt/components/search_field.dart';
import 'package:doctor_hunt/components/section_header.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoriteDoctorPage extends StatefulWidget {
  const FavoriteDoctorPage({super.key});

  @override
  State<FavoriteDoctorPage> createState() => _FavoriteDoctorPageState();
}

class _FavoriteDoctorPageState extends State<FavoriteDoctorPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    List<Map<String, dynamic>> doctors = [
      {
        "images": "assets/images/doc-4.jpg",
        "name": "Dr. Shouey",
        "speciality": "Specalist Cardiology",
        "isFavourite": false,
      },
      {
        "images": "assets/images/doc-3.jpg",
        "name": "Dr. Christenfeld N",
        "speciality": "Specalist Cancer",
        "isFavourite": true,
      },
      {
        "images": "assets/images/doc-2.jpg",
        "name": "Dr. Shouey",
        "speciality": "Specalist Medicine",
        "isFavourite": true,
      },
      {
        "images": "assets/images/doc-1.jpg",
        "name": "Dr. Shouey",
        "speciality": "Specalist Dentist",
        "isFavourite": false,
      },
    ];

    List<Map<String, dynamic>> featuredDoctors = [
      {
        "images": "assets/images/doc-4.jpg",
        "name": "Dr. Crick",
        "rating": 3.7,
        "price": 25.00,
        "isFavorited": false,
      },
      {
        "images": "assets/images/doc-5.jpg",
        "name": "Dr. Strain",
        "rating": 3.0,
        "price": 22.00,
        "isFavorited": true,
      },
      {
        "images": "assets/images/doc-6.jpg",
        "name": "Dr. Lachinet",
        "rating": 2.9,
        "price": 29.00,
        "isFavorited": false,
      },
      {
        "images": "assets/images/doc-4.jpg",
        "name": "Dr. Crick",
        "rating": 3.0,
        "price": 25.00,
        "isFavorited": true,
      },
    ];

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
                onSubmit: () {},
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 229 * 2 + 25,
                      child: GridView.builder(
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
                            image: doctors[index]['images'],
                            name: doctors[index]['name'],
                            speciality: doctors[index]['speciality'],
                            isFavorited: doctors[index]['isFavourite'],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    const SectionHeader(title: "Feature Doctor"),
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
