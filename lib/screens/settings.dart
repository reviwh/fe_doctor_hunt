import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool textMessages = true, phoneCalls = true;

  @override
  Widget build(BuildContext context) {
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
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.3,
                    color: darkCharcoal,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Account Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: -0.3,
                          color: slateGray,
                        ),
                      ),
                    ),
                    _settingsListTile(
                      onTap: () {},
                      title: "Change Password",
                      icon: "assets/icons/lock.svg",
                      color: const Color(0xFFEB5757),
                    ),
                    _settingsListTile(
                      onTap: () {},
                      title: "Notifications",
                      icon: "assets/icons/notification.svg",
                      color: const Color(0xFF219653),
                    ),
                    _settingsListTile(
                      onTap: () {},
                      title: "Statistics",
                      icon: "assets/icons/statistic.svg",
                      color: const Color(0xFF56CCF2),
                    ),
                    _settingsListTile(
                      onTap: () {},
                      title: "About Us",
                      icon: "assets/icons/about-us.svg",
                      color: const Color(0xFFF2994A),
                    ),
                    const SizedBox(height: 18),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "More Options",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: -0.3,
                          color: slateGray,
                        ),
                      ),
                    ),
                    _switchListTile(
                      title: "Text messages",
                      value: textMessages,
                      onChange: (value) {
                        setState(() {
                          textMessages = value;
                        });
                      },
                    ),
                    _switchListTile(
                      title: "Phone calls",
                      value: phoneCalls,
                      onChange: (value) {
                        setState(() {
                          phoneCalls = value;
                        });
                      },
                    ),
                    _optionsListTile(
                      onTap: () {},
                      title: "Languages",
                      subtitle: "English",
                    ),
                    _optionsListTile(
                      onTap: () {},
                      title: "Currency",
                      subtitle: "\$-USD",
                    ),
                    _optionsListTile(
                      onTap: () {},
                      title: "Linked Account",
                      subtitle: "Facebook, Google",
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _settingsListTile({
    String title = "",
    String icon = "",
    Color color = green,
    required Function() onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            leading: Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                letterSpacing: -.3,
                color: slateGray,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: slateGray,
            ),
          ),
        ),
        _divider(),
      ],
    );
  }

  Widget _optionsListTile({
    String title = "",
    String subtitle = "",
    required Function() onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                letterSpacing: -.3,
                color: slateGray,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    letterSpacing: -.3,
                    color: slateGray,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: slateGray,
                ),
              ],
            ),
          ),
        ),
        _divider(),
      ],
    );
  }

  Widget _switchListTile({
    String title = "",
    bool value = false,
    required Function(bool) onChange,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              letterSpacing: -.3,
              color: slateGray,
            ),
          ),
          trailing: _switch(
            value: value,
            onChanged: onChange,
          ),
        ),
        _divider(),
      ],
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        height: 1,
        thickness: 1,
        color: green.withOpacity(.08),
      ),
    );
  }

  Widget _switch({
    bool value = false,
    required ValueChanged<bool> onChanged,
  }) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return green;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return green.withOpacity(0.54);
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> thumbColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return null;
      },
    );
    return Switch(
      value: value,
      onChanged: onChanged,
      trackColor: trackColor,
      overlayColor: overlayColor,
      thumbColor: thumbColor,
    );
  }
}
