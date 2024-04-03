import 'package:doctor_hunt/components/form_field.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/components/social_media_button.dart';
import 'package:doctor_hunt/screens/home.dart';
import 'package:doctor_hunt/screens/login.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isAgreed = false;
  bool _isPasswordVisible = false;

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
                          'Join us to start searching',
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
                        const SizedBox(height: 48),
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
                                hintText: 'Name',
                                controller: _nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Name cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 18.0),
                              CustomTextField(
                                hintText: "Email",
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
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
                              const SizedBox(height: 14.0),
                              Row(
                                children: [
                                  _checkbox(
                                    isChecked: _isAgreed,
                                    onChanged: (value) {
                                      setState(() {
                                        _isAgreed = value!;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'I agree with the Terms of Service & Privacy Policy',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      letterSpacing: -.3,
                                      color: slateGray,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32.0),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: CustomPrimaryButton(
                                  text: 'Sign up',
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Registration successful!'),
                                        ),
                                      );
                                    }
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
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Have an account? Log in",
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
          // CustomBodyWidget(
          //   child:
          // ),
        ],
      ),
    );
  }

  Widget _checkbox({
    bool isChecked = false,
    required Function(bool?) onChanged,
  }) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return green.withOpacity(.2);
      }
      return isChecked ? green : slateGray.withOpacity(.5);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      side: BorderSide.none,
      shape: const CircleBorder(),
      value: isChecked,
      onChanged: onChanged,
    );
  }
}
