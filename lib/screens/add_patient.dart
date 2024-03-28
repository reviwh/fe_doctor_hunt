import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/components/form_field.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

enum Gender { male, female, others }

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({super.key});

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  List<int> days = [], years = [];
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  Gender? selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    for (int i = 1; i <= 31; i++) {
      days.add(i);
    }

    for (int i = 1900; i <= 2024; i++) {
      years.add(i);
    }

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
                    "Patient Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -0.3,
                      color: darkCharcoal,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: const Color(0xFF000000).withOpacity(.05),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Step 1/4",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 234,
                              height: 5,
                              decoration: BoxDecoration(
                                color: green.withOpacity(.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              width: 90,
                              height: 5,
                              decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView(
                      children: [
                        const CustomFormField(
                          label: "Patient's Name",
                          child: CustomTextField(
                            hintText: "Abdullah Mamun",
                          ),
                        ),
                        CustomFormField(
                          label: "Age",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomSelectOption(
                                width: 120,
                                items: days,
                                onChanged: (value) {},
                                hintText: "Day",
                              ),
                              CustomSelectOption(
                                width: 120,
                                items: months,
                                onChanged: (value) {},
                                hintText: "Month",
                              ),
                              CustomSelectOption(
                                width: 120,
                                items: years.reversed.toList(),
                                onChanged: (value) {},
                                hintText: "Year",
                              ),
                            ],
                          ),
                        ),
                        CustomFormField(
                          label: "Gender",
                          child: Row(
                            children: [
                              CustomRadio(
                                value: Gender.male,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                                title: "Male",
                              ),
                              const SizedBox(width: 15),
                              CustomRadio(
                                value: Gender.female,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                                title: "Female",
                              ),
                              const SizedBox(width: 15),
                              CustomRadio(
                                value: Gender.others,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                                title: "Others",
                              ),
                            ],
                          ),
                        ),
                        const CustomFormField(
                          label: "Mobile Number",
                          child: CustomTextField(
                            hintText: "+8801000000000",
                          ),
                        ),
                        const CustomFormField(
                          label: "Email",
                          child: CustomTextField(
                            hintText: "itsmemamun1@gmail.com",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 54,
                    vertical: 38,
                  ),
                  child: CustomPrimaryButton(
                    onTap: () {},
                    text: "Continue",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
