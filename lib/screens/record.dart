import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
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
          const CustomAppBar(
            prefix: CustomBackButton(),
            title: Text(
              'Add Records',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: -.3,
                color: darkCharcoal,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                var data = records[index];
                return _recordCard(
                  date: data['date'],
                  by: data['by'],
                  to: data['to'],
                  prescription: data['prescription'],
                  isNew: data['isNew'],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: records.length,
            ),
          ),
        ],
      )),
    ]));
  }

  Widget _recordCard({
    required DateTime date,
    String by = 'you',
    String to = '',
    int prescription = 0,
    bool isNew = true,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
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
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 55,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: green,
                    ),
                    child: Center(
                      child: Text(
                        '${date.day.toString().padLeft(2, '0')}\n${DateFormat('MMM').format(date).toUpperCase()}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: -.3,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (isNew)
                    Container(
                      width: 55,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: green.withOpacity(.1),
                      ),
                      child: const Center(
                        child: Text(
                          'NEW',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: -.3,
                            color: green,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Record added by $by',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: -.3,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Record for $to',
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        letterSpacing: -.3,
                        color: green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$prescription Prescriptions',
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        letterSpacing: -.3,
                        color: slateGray,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.more_vert_rounded, color: slateGray),
            ),
          ),
        ],
      ),
    );
  }
}
