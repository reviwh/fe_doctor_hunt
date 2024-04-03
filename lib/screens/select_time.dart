import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({super.key});

  @override
  State<SelectTimePage> createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  String _getString(DateTime date) {
    String dayName;
    if (DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd').format(DateTime.now())) {
      dayName = 'Today';
    } else if (DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd')
            .format(DateTime.now().add(const Duration(days: 1)))) {
      dayName = 'Tomorrow';
    } else {
      dayName = DateFormat('EEEE').format(date).substring(0, 3);
    }
    return "$dayName, ${DateFormat('dd MMM').format(date)}";
  }

  int _selectedIndex = 0, _afternoonTimeIndex = 0, _eveningTimeIndex = 0;
  bool _isAvailable = false;

  final _times = times;

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
                    'Select Time',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -0.3,
                      color: darkCharcoal,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: [
                      _card(),
                      SizedBox(
                        height: 60,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: _times.length,
                          itemBuilder: (context, index) => _timeCard(
                            type: _times[index]['type'],
                            time: _getString(_times[index]['time']),
                            slot: _times[index]['slot'],
                            onTap: () {
                              if (_times[index]['type'] !=
                                  TimeCardType.disabled) {
                                setState(() {
                                  _selectedIndex = index;
                                  _isAvailable = _times[index]['type'] ==
                                      TimeCardType.available;
                                });
                              }
                            },
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16),
                        ),
                      ),
                      _isAvailable
                          ? _buildAvailableContent()
                          : _buildUnavailableContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
        height: 88,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 20),
          ],
        ),
        child: Row(children: [
          Container(
            width: 72,
            height: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: const DecorationImage(
                image: AssetImage('assets/images/doc-2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dr. Shruti Kedia",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: -0.3,
                        color: darkCharcoal,
                      ),
                    ),
                    const Text(
                      "Upasana Dental Clinic, salt lake",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: -0.3,
                        color: slateGray,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/stars.png',
                      width: 64,
                      height: 10,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                Positioned(
                  top: 6,
                  right: 6,
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
          ),
        ]));
  }

  Widget _timeCard({
    required TimeCardType type,
    required String time,
    required int slot,
    required Function() onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: type == TimeCardType.available ? green : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: type == TimeCardType.available
                  ? green
                  : slateGray.withOpacity(.1),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: -0.3,
                    color: switch (type) {
                      TimeCardType.available => Colors.white,
                      TimeCardType.unavailable => darkCharcoal,
                      TimeCardType.disabled => slateGray,
                    },
                  ),
                ),
                Text(
                  (slot == 0) ? 'No slots available' : '$slot slots available',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    letterSpacing: -0.3,
                    color: type == TimeCardType.available
                        ? Colors.white
                        : slateGray,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUnavailableContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            _getString(_times[_selectedIndex]['time']),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              letterSpacing: -0.3,
              color: darkCharcoal,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'No slots available',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                letterSpacing: -0.3,
                fontSize: 14,
                color: slateGray,
              ),
            ),
          ),
          CustomPrimaryButton(
            text:
                'Next availability on ${_getString(_times[_selectedIndex + 1]['time'])}',
            onTap: () {
              setState(() {
                _isAvailable = _times[_selectedIndex + 1]['type'] ==
                    TimeCardType.available;
                _selectedIndex++;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.all(14),
            child: Text(
              'OR',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: slateGray,
              ),
            ),
          ),
          CustomOutlinedButton(
            text: 'Contact Clinic',
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget _buildAvailableContent() {
    var item = _times[_selectedIndex];
    var times = item['slotTime'];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              _getString(item['time']),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                letterSpacing: -0.3,
                color: darkCharcoal,
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (times != null && times['afternoon'] != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Afternoon ${times['afternoon'].length} slots',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -0.3,
                  color: darkCharcoal,
                ),
              ),
            ),
          if (times != null && times['afternoon'] != null)
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var i = 0; i < times['afternoon'].length; i++)
                  _timeContainer(
                    index: i,
                    time: times['afternoon'][i],
                    isActive: i == _afternoonTimeIndex,
                    onTap: () {
                      setState(() {
                        _afternoonTimeIndex = i;
                      });
                    },
                  ),
              ],
            ),
          const SizedBox(height: 4),
          if (times != null && times['evening'] != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Evening ${times['evening'].length} slots',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -0.3,
                  color: darkCharcoal,
                ),
              ),
            ),
          if (times != null && times['evening'] != null)
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var i = 0; i < times['evening'].length; i++)
                  _timeContainer(
                    index: i,
                    time: times['afternoon'][i],
                    isActive: i == _eveningTimeIndex,
                    onTap: () {
                      setState(() {
                        _eveningTimeIndex = i;
                      });
                    },
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _timeContainer({
    required int index,
    String time = '',
    bool isActive = false,
    required Function() onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Container(
        width: 76,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isActive ? green : green.withOpacity(.08),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: -.3,
              color: isActive ? Colors.white : green,
            ),
          ),
        ),
      ),
    );
  }
}
