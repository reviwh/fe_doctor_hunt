import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calendar extends StatelessWidget {
  final List<DateTime?> value;
  final Function(List<DateTime?>) onChange;
  const Calendar({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView(
        children: [
          _buildDefaultSingleDatePickerWithValue(),
        ],
      ),
    );
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      selectedDayHighlightColor: green,
      weekdayLabels: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
      weekdayLabelTextStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.black,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 56,
      controlsTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
      ),
      lastMonthIcon: const Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.white,
        size: 12,
      ),
      nextMonthIcon: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 12,
      ),
      dayTextStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.black,
      ),
      disabledDayTextStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: silver,
      ),
      selectedDayTextStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
      selectableDayPredicate: (day) => !day
          .difference(DateTime.now().subtract(const Duration(days: 1)))
          .isNegative,
    );
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 20,
            )
          ]),
      child: Stack(
        children: [
          Container(
            height: 56,
            decoration: const BoxDecoration(
              color: green,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
          ),
          CalendarDatePicker2(
            config: config,
            value: value,
            onValueChanged: onChange,
          ),
        ],
      ),
    );
  }
}
