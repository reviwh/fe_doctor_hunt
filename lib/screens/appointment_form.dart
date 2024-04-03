import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/bottom_navbar.dart';
import 'package:doctor_hunt/components/form_field.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/components/section_header.dart';
import 'package:doctor_hunt/screens/appointment_time_form.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentFormPage extends StatefulWidget {
  const AppointmentFormPage({super.key});

  @override
  State<AppointmentFormPage> createState() => _AppointmentFormPageState();
}

class _AppointmentFormPageState extends State<AppointmentFormPage> {
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
              const CustomAppBar(
                prefix: CustomBackButton(),
                title: Text(
                  "Appointment",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.3,
                    color: darkCharcoal,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: ListView(
                  children: [
                    _card(),
                    const SizedBox(height: 10),
                    _appointmentSection(),
                    _patientSection(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomPrimaryButton(
                        text: "Next",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AppointmentTimeFormPage(),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(height: 64),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            child: BottomNavbar(),
          ),
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
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
      child: Row(
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
                    colorFilter: const ColorFilter.mode(red, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _appointmentSection() {
    return const Column(
      children: [
        SectionHeader(title: "Appointment For", isMore: false),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
          child: CustomTextField(hintText: "Patient Name"),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: CustomTextField(hintText: "Contact Number"),
        ),
      ],
    );
  }

  Widget _patientSection() {
    List data = patients;
    data.insert(0, {'name': null, 'image': null});

    return Column(
      children: [
        const SectionHeader(title: "Who is this patient?", isMore: false),
        SizedBox(
          height: 200,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => _patientCard(
              name: data[index]['name'],
              image: data[index]['image'],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: data.length,
          ),
        ),
      ],
    );
  }

  Widget _patientCard({String? name, String? image}) {
    if (name != null && image != null) {
      return Column(children: [
        Container(
          width: 100,
          height: 125,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: -.3,
              color: slateGray,
            ),
          ),
        )
      ]);
    } else {
      return Column(
        children: [
          Container(
            width: 100,
            height: 125,
            decoration: BoxDecoration(
              color: green.withOpacity(.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_rounded,
                  color: green,
                  size: 48,
                ),
                Text(
                  "Add",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    letterSpacing: -.3,
                    color: green,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
