import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/components/section_header.dart';
import 'package:doctor_hunt/screens/appointment_form.dart';
import 'package:doctor_hunt/screens/find_doctor.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorDetailPage extends StatefulWidget {
  const DoctorDetailPage({super.key});

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
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
          Column(
            children: [
              CustomAppBar(
                prefix: const CustomBackButton(),
                title: const Text(
                  "Doctor Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.3,
                    color: darkCharcoal,
                  ),
                ),
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
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _card(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 36),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _tab("100", "Running"),
                          _tab("500", "Ongoing"),
                          _tab("700", "Patient"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    _serviceSection(),
                    _map(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      padding: const EdgeInsets.all(16),
      height: 172,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 92,
                height: 87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/doc-6.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dr. Pediatrician",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: -.3,
                            color: darkCharcoal,
                          ),
                        ),
                        const Text(
                          "Specialist Cardiologist",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            letterSpacing: -.3,
                            color: slateGray,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/icons/stars.png',
                              width: 84,
                              height: 12,
                              fit: BoxFit.contain,
                            ),
                            const Text.rich(
                              TextSpan(
                                text: "\$ ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -.3,
                                  color: green,
                                ),
                                children: [
                                  TextSpan(
                                    text: "28.00/hr",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      letterSpacing: -.3,
                                      color: slateGray,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        'assets/icons/favorite.svg',
                        width: 16,
                        height: 16,
                        fit: BoxFit.contain,
                        colorFilter:
                            const ColorFilter.mode(red, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 140,
            child: CustomPrimaryButton(
              text: "Book Now",
              fontSize: 14,
              borderRadius: 4,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppointmentFormPage(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(String text, String subText) {
    return Container(
      width: 90,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFCBCBCB).withOpacity(.12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              letterSpacing: -0.3,
              color: darkCharcoal,
            ),
          ),
          Text(
            subText,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: -0.3,
              color: slateGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceSection() {
    return Column(
      children: [
        const SectionHeader(title: "Services", isMore: false),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: services.length,
          separatorBuilder: (context, index) => Divider(
            height: 32,
            thickness: 0.8,
            color: slateGray.withOpacity(.1),
          ),
          itemBuilder: (context, index) => Text.rich(
            TextSpan(
              text: "${index + 1}.  ",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: -.3,
                color: green,
              ),
              children: [
                TextSpan(
                  text: services[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: -.3,
                    color: slateGray,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _map() {
    return AspectRatio(
      aspectRatio: 67 / 42,
      child: Container(
        height: 210,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 30,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/map.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
