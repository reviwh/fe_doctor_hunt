import 'package:doctor_hunt/components/form_field.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/components/social_media_button.dart';
import 'package:doctor_hunt/screens/home.dart';
import 'package:doctor_hunt/screens/register.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _searchEmailController = TextEditingController();

  final _digit1Controller = TextEditingController();
  final _digit2Controller = TextEditingController();
  final _digit3Controller = TextEditingController();
  final _digit4Controller = TextEditingController();

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 84),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const Text(
                          'Welcome back',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            letterSpacing: -0.3,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 48, vertical: 16),
                          child: Text(
                            'You can search course, apply course, and find scholarship for abroad studies',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: -0.3,
                              color: slateGray,
                            ),
                          ),
                        ),
                        const SizedBox(height: 56),
                        Row(
                          children: [
                            Expanded(
                              child: SocialMediaButton(
                                icon: 'assets/icons/google_icon.png',
                                title: 'Google',
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: SocialMediaButton(
                                icon: 'assets/icons/facebook_icon.png',
                                title: 'Facebook',
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextField(
                                hintText: "Email",
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                suffix: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.check_rounded,
                                      size: 16,
                                      color: slateGray,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  if (!RegExp(
                                          r'^.+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$')
                                      .hasMatch(value)) {
                                    return 'Invalid email address';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 18.0),
                              CustomPasswordField(
                                hintText: 'Password',
                                controller: _passwordController,
                                isVisible: _isPasswordVisible,
                                togglePassword: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 32.0),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomPrimaryButton(
                                  text: 'Login',
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                        (route) => false,
                                      );
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextButton(
                                  text: 'Forgot Password?',
                                  fontSize: 14,
                                  onTap: () {
                                    showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      useSafeArea: true,
                                      constraints:
                                          const BoxConstraints(maxHeight: 400),
                                      context: context,
                                      builder: ((context) =>
                                          _searchEmailSheet()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            child: SizedBox(
              width: screen.width,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Don’t have an account? Join us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: -0.3,
                    color: green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchEmailSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 130,
                height: 5,
                color: silver,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 36, 20, 12),
          child: Text(
            "Forgot Password",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              letterSpacing: -0.3,
              color: Colors.black,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Enter your email for the verification proccesss, we will send 4 digits code to your email.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: -0.3,
              color: slateGray,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomTextField(
            controller: _searchEmailController,
            hintText: "Email",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: CustomPrimaryButton(
            text: "Continue",
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                backgroundColor: Colors.white,
                useSafeArea: true,
                constraints: const BoxConstraints(maxHeight: 400),
                context: context,
                builder: ((context) => _otpSheet()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _otpSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 130,
                height: 5,
                color: silver,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 36, 20, 12),
          child: Text(
            "Enter 4 Digits Code",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              letterSpacing: -0.3,
              color: Colors.black,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Enter the 4 digits code that you received on your email.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: -0.3,
              color: slateGray,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  textColor: green,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  controller: _digit1Controller,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  textColor: green,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  controller: _digit2Controller,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  textColor: green,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  controller: _digit3Controller,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  textColor: green,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  controller: _digit4Controller,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: CustomPrimaryButton(
            text: "Continue",
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                backgroundColor: Colors.white,
                useSafeArea: true,
                constraints: const BoxConstraints(maxHeight: 460),
                context: context,
                builder: (context) => _resetPasswordSheet(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _resetPasswordSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 130,
                height: 5,
                color: silver,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 36, 20, 12),
          child: Text(
            "Reset Password",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              letterSpacing: -0.3,
              color: Colors.black,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Set the new password for your account so you can login and access all the features.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: -0.3,
              color: slateGray,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
          child: CustomPasswordField(
            controller: _newPasswordController,
            isVisible: _isNewPasswordVisible,
            togglePassword: () {
              setState(() {
                _isNewPasswordVisible = !_isNewPasswordVisible;
              });
            },
            hintText: "New Password",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
          child: CustomPasswordField(
            controller: _confirmPasswordController,
            isVisible: _isConfirmPasswordVisible,
            togglePassword: () {
              setState(() {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            },
            hintText: "Re-enter Password",
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: CustomPrimaryButton(
            text: "Continue",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
