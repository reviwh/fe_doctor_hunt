import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final Widget child;

  const CustomFormField({
    super.key,
    this.label = "",
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: -.3,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 9),
          child,
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({
    super.key,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        letterSpacing: -.3,
        color: slateGray,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
          letterSpacing: -.3,
          color: slateGray,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: red,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
    );
  }
}

class CustomSelectOption<T> extends StatelessWidget {
  final double? width;
  final List<T> items;
  final Function(T?) onChanged;
  final String hintText;

  const CustomSelectOption(
      {super.key,
      this.items = const [],
      required this.onChanged,
      this.hintText = "",
      this.width});
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      width: width,
      hintText: hintText,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        letterSpacing: -.3,
        color: slateGray,
      ),
      trailingIcon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: slateGray,
      ),
      selectedTrailingIcon: const Icon(
        Icons.keyboard_arrow_up_rounded,
        color: slateGray,
      ),
      onSelected: onChanged,
      menuStyle: MenuStyle(
        surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      menuHeight: 250,
      dropdownMenuEntries: items.map<DropdownMenuEntry<T>>((T value) {
        return DropdownMenuEntry<T>(
          value: value,
          label: value.toString(),
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                fontFamily: "Rubik",
                fontWeight: FontWeight.w300,
                fontSize: 16,
                letterSpacing: -.3,
                color: slateGray,
              ),
            ),
          ),
        );
      }).toList(),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
          letterSpacing: -.3,
          color: slateGray,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: red,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
    );
  }
}

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return green;
            }
            return slateGray;
          }),
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            letterSpacing: -.3,
            color: slateGray,
          ),
        ),
      ],
    );
  }
}
