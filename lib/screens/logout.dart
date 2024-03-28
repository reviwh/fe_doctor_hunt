import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class LogOutPage extends StatefulWidget {
  const LogOutPage({super.key});

  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showDialog(
            context: context, builder: (context) => const LogOutDialog());
      },
      child: const Text("Log Out"),
    );
  }
}

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      titlePadding: const EdgeInsets.fromLTRB(28, 24, 28, 4),
      title: const Text(
        'Log Out',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 26,
          letterSpacing: -.3,
          color: Colors.black,
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(28, 0, 28, 32),
      content: const Text(
        'Are you sure you want to log out?',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: -.3,
          color: slateGray,
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(28, 0, 28, 12),
      actions: [
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                letterSpacing: -.3,
                color: green,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Ok',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                letterSpacing: -.3,
                color: green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
