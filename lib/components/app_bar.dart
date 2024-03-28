import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? prefix;
  final Widget? title;
  final Widget? suffix;
  const CustomAppBar({super.key, this.prefix, this.title, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 36, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          prefix ?? const SizedBox(),
          const SizedBox(width: 19),
          Expanded(child: title ?? const SizedBox()),
          const SizedBox(width: 19),
          suffix ?? const SizedBox(),
        ],
      ),
    );
  }
}
