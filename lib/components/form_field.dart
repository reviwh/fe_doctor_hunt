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
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;
  final String hintText;
  final double borderRadius;
  final double borderWidth;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? suffix;
  const CustomTextField({
    super.key,
    this.fontWeight = FontWeight.w300,
    this.fontSize = 16,
    this.textColor = slateGray,
    this.textAlign = TextAlign.start,
    this.hintText = "",
    this.borderRadius = 12,
    this.borderWidth = 1,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLength: maxLength,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: -.3,
        color: textColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: fontSize,
          letterSpacing: -.3,
          color: textColor,
        ),
        counterText: "",
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            color: slateGray.withOpacity(.16),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            color: red,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isVisible;
  final Function()? togglePassword;

  const CustomPasswordField({
    super.key,
    this.hintText = "",
    this.controller,
    this.validator,
    this.keyboardType,
    this.isVisible = false,
    this.togglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: !isVisible,
      keyboardType: keyboardType,
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: togglePassword,
            icon: Icon(
              isVisible
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              size: 18,
              color: slateGray,
            ),
          ),
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
