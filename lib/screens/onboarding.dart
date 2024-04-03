import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/components/slider.dart';
import 'package:doctor_hunt/screens/register.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (value) {
                      currentIndex = value;
                    },
                    itemCount: onboardSliders.length,
                    itemBuilder: (context, index) {
                      return OnBoardingSlider(
                        image: onboardSliders[index]['image'],
                        title: onboardSliders[index]['title'],
                        description: onboardSliders[index]['description'],
                        isLeft: index % 2 != 0,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomPrimaryButton(
                    text: 'Get Started',
                    onTap: () {
                      currentIndex == onboardSliders.length - 1
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()))
                          : _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomTextButton(
                    text: "Skip",
                    fontSize: 14,
                    color: slateGray,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 14),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          )
        ],
      ),
    );
  }
}
