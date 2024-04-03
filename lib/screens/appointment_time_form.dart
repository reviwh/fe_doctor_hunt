import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/calendar.dart';
import 'package:doctor_hunt/components/circular_option.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/components/thank_you_dialog.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentTimeFormPage extends StatefulWidget {
  const AppointmentTimeFormPage({super.key});

  @override
  State<AppointmentTimeFormPage> createState() =>
      _AppointmentTimeFormPageState();
}

class _AppointmentTimeFormPageState extends State<AppointmentTimeFormPage> {
  int selectedTime = 2, selectedReminder = 2;
  DateTime dateValue = DateTime.now();

  

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
                    "Appointment",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -.3,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          child: Calendar(
                            value: [dateValue],
                            onChange: (date) {
                              setState(() {
                                dateValue = date[0]!;
                              });
                            },
                          )),
                      const SizedBox(height: 14),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(48)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF000000).withOpacity(.08),
                                blurRadius: 25,
                              )
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 36, 20, 28),
                              child: Text(
                                "Available Time",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -.3,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  availableTimes.length,
                                  (index) {
                                    return CircularOptions(
                                      value: availableTimes[index]['time'],
                                      text:
                                          "${availableTimes[index]['time']} \n ${availableTimes[index]['timeFormat']}",
                                      isActive: selectedTime == index,
                                      onTap: () {
                                        setState(() {
                                          selectedTime = index;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 36, 20, 28),
                              child: Text(
                                "Reminder Me Before",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -.3,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  reminders.length,
                                  (index) {
                                    return CircularOptions(
                                      value: reminders[index]['minutes'],
                                      text:
                                          "${reminders[index]['minutes']} \n min",
                                      isActive: selectedReminder == index,
                                      onTap: () {
                                        setState(() {
                                          selectedReminder = index;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              child: CustomPrimaryButton(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: ((context) => ThankYouDialog(
                                          doctor: "Dr. Pediatrician Purpieson",
                                          date: DateFormat('MMMM d')
                                              .format(dateValue)
                                              .toString(),
                                          time:
                                              "${availableTimes[selectedTime]['time']} ${availableTimes[selectedTime]['timeFormat']}",
                                        )),
                                  );
                                },
                                text: 'Confirm',
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
