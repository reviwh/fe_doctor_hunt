import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/category_card.dart';
import 'package:doctor_hunt/components/popular_doctor_card.dart';
import 'package:doctor_hunt/components/section_header.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularDoctorPage extends StatefulWidget {
  const PopularDoctorPage({super.key});

  @override
  State<PopularDoctorPage> createState() => _PopularDoctorPageState();
}

class _PopularDoctorPageState extends State<PopularDoctorPage> {
  List<Map<String, dynamic>> popularDoctor = [
    {
      "images": "assets/images/doc-7.jpg",
      "name": "Dr. Truluck Nik",
      "speciality": "Medicine Specialist",
    },
    {
      "images": "assets/images/doc-8.jpg",
      "name": "Dr. Tranquilli",
      "speciality": "Patheology Specialist",
    },
    {
      "images": "assets/images/doc-5.jpg",
      "name": "Dr. Truluck Nik",
      "speciality": "Medicine Specialist",
    },
  ];

  List<Map<String, dynamic>> categories = [
    {
      "images": "assets/images/doc-6.jpg",
      "name": "Dr. Pediatrician",
      "speciality": "Specialist Cardiologist",
      "rating": 2.4,
      "views": 2475,
      "isFavorited": true,
    },
    {
      "images": "assets/images/doc-5.jpg",
      "name": "Dr. Mistry Brick",
      "speciality": "Specialist Dentist",
      "rating": 2.8,
      "views": 2893,
      "isFavorited": false,
    },
    {
      "images": "assets/images/doc-4.jpg",
      "name": "Dr. Ether Wall",
      "speciality": "Specialist Cancer",
      "rating": 2.7,
      "views": 2754,
      "isFavorited": true,
    },
    {
      "images": "assets/images/doc-8.jpg",
      "name": "Dr. Johan Smith",
      "speciality": "Specialist Cardiologist",
      "rating": 2.8,
      "views": 2821,
      "isFavorited": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Image.asset(
          'assets/images/bg.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Column(
          children: [
            CustomAppBar(
              prefix: const CustomBackButton(),
              suffix: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(slateGray, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  const SectionHeader(title: "Popular Doctor"),
                  SizedBox(
                    height: 252,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularDoctor.length,
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (context, index) {
                        return PopularDoctorCard(
                          images: popularDoctor[index]['images'],
                          name: popularDoctor[index]['name'],
                          speciality: popularDoctor[index]['speciality'],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                    ),
                  ),
                  const SectionHeader(title: "Category", isMore: false),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 128 * categories.length + 2,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          image: categories[index]['images'],
                          name: categories[index]['name'],
                          speciality: categories[index]['speciality'],
                          rating: categories[index]['rating'],
                          views: categories[index]['views'],
                          isFavorited: categories[index]['isFavorited'],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ]),
    );
  }
}
