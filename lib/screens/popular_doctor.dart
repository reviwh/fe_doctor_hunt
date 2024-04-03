import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/category_card.dart';
import 'package:doctor_hunt/components/popular_doctor_card.dart';
import 'package:doctor_hunt/components/section_header.dart';
import 'package:doctor_hunt/screens/doctor_details.dart';
import 'package:doctor_hunt/screens/find_doctor.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularDoctorPage extends StatefulWidget {
  const PopularDoctorPage({super.key});

  @override
  State<PopularDoctorPage> createState() => _PopularDoctorPageState();
}

class _PopularDoctorPageState extends State<PopularDoctorPage> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Image.asset(
          'assets/images/bg.png',
          width: screen.width,
          height: screen.height,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Column(
          children: [
            CustomAppBar(
              prefix: const CustomBackButton(),
              suffix: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindDoctorPage()));
                },
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 18,
                  height: 18,
                  colorFilter:
                      const ColorFilter.mode(slateGray, BlendMode.srcIn),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  SectionHeader(
                    title: "Popular Doctor",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PopularDoctorPage(),
                          ));
                    },
                  ),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DoctorDetailPage(),
                                ));
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                    ),
                  ),
                  const SectionHeader(title: "Category", isMore: false),
                  const SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: doctorByCategories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        image: doctorByCategories[index]['images'],
                        name: doctorByCategories[index]['name'],
                        speciality: doctorByCategories[index]['speciality'],
                        rating: doctorByCategories[index]['rating'],
                        views: doctorByCategories[index]['views'],
                        isFavorited: doctorByCategories[index]['isFavorited'],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DoctorDetailPage(),
                              ));
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 14),
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
