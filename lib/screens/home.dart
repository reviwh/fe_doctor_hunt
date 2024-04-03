import 'package:doctor_hunt/components/bottom_navbar.dart';
import 'package:doctor_hunt/components/feature_card.dart';
import 'package:doctor_hunt/components/live_card.dart';
import 'package:doctor_hunt/components/logout_dialog.dart';
import 'package:doctor_hunt/components/popular_doctor_card.dart';
import 'package:doctor_hunt/components/search_field.dart';
import 'package:doctor_hunt/components/section_header.dart';
import 'package:doctor_hunt/screens/diagnostic_test.dart';
import 'package:doctor_hunt/screens/doctor.dart';
import 'package:doctor_hunt/screens/doctor_details.dart';
import 'package:doctor_hunt/screens/doctor_live.dart';
import 'package:doctor_hunt/screens/find_doctor.dart';
import 'package:doctor_hunt/screens/help_center.dart';
import 'package:doctor_hunt/screens/medical_record.dart';
import 'package:doctor_hunt/screens/medicine_order.dart';
import 'package:doctor_hunt/screens/my_doctor.dart';
import 'package:doctor_hunt/screens/popular_doctor.dart';
import 'package:doctor_hunt/screens/privacy_policy.dart';
import 'package:doctor_hunt/screens/profile.dart';
import 'package:doctor_hunt/screens/settings.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      key: _key,
      drawer: _menuDrawer(),
      body: Stack(children: [
        Image.asset(
          'images/bg.png',
          width: screen.width,
          height: screen.height,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 210),
                    const SectionHeader(title: "Live Doctors", isMore: false),
                    SizedBox(
                      height: 185,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(20),
                        scrollDirection: Axis.horizontal,
                        itemCount: liveImages.length,
                        itemBuilder: (context, index) {
                          return LiveCard(
                            image: liveImages[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DoctorLivePage()),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 14),
                      ),
                    ),
                    SizedBox(
                        height: 150,
                        child: ListView(
                          padding: const EdgeInsets.all(30),
                          scrollDirection: Axis.horizontal,
                          children: [
                            _categoryButton(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [palatinateBlue, violet]),
                              icon: 'assets/icons/tooth.svg',
                            ),
                            const SizedBox(width: 12),
                            _categoryButton(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [green, caribbeanGreen]),
                              icon: 'assets/icons/heart.svg',
                            ),
                            const SizedBox(width: 12),
                            _categoryButton(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [mango, crayola]),
                              icon: 'assets/icons/eye.svg',
                            ),
                            const SizedBox(width: 12),
                            _categoryButton(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [sunburnt, pastelRed]),
                              icon: 'assets/icons/weight.svg',
                            ),
                          ],
                        )),
                    SectionHeader(
                      title: "Popular Doctor",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PopularDoctorPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 2),
                    SizedBox(
                      height: 316,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularDoctorsHome.length,
                        padding: const EdgeInsets.all(20),
                        itemBuilder: (context, index) {
                          return PopularDoctorBigCard(
                            images: popularDoctorsHome[index]['image'],
                            name: popularDoctorsHome[index]['name'],
                            speciality: popularDoctorsHome[index]['speciality'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DoctorDetailPage()),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                      ),
                    ),
                    SectionHeader(
                      title: "Feature Doctor",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DoctorPage()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 185,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(20),
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredDoctors.length,
                        itemBuilder: (context, index) {
                          return FeatureCard(
                              image: featuredDoctors[index]['images'],
                              name: featuredDoctors[index]['name'],
                              rating: featuredDoctors[index]['rating'],
                              price: featuredDoctors[index]['price'],
                              isFavorited: featuredDoctors[index]
                                  ['isFavorited'],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DoctorDetailPage()),
                                );
                              });
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                      ),
                    ),
                    const SizedBox(height: 84),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: screen.width,
            height: 156,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [green, caribbeanGreen],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Handwarker!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          letterSpacing: -.3,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Find Your Doctors',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          letterSpacing: -.3,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _key.currentState!.openDrawer(),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/user-1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 28),
              SearchField(
                controller: search,
                hint: "Search...",
                onSubmit: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindDoctorPage()),
                  );
                },
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          child: BottomNavbar(),
        )
      ]),
    );
  }

  Widget _categoryButton({
    required Gradient gradient,
    required String icon,
  }) {
    return Container(
        width: 80,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: gradient,
        ),
        child: InkWell(
          onTap: () {},
          child: Stack(children: [
            Positioned(
              top: 0,
              right: -32,
              child: Container(
                width: 67,
                height: 67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: Colors.white.withOpacity(.08),
                ),
              ),
            ),
            Positioned(
              bottom: -28,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(.08),
                ),
              ),
            ),
            Center(
                child: SizedBox(
              width: 44,
              height: 44,
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ))
          ]),
        ));
  }

  Widget _menuDrawer() {
    final screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF6F7FA1), Color(0xFF536184)],
      )),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(),
            _buildMenu(),
            const SizedBox(height: 32),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Abdullah Mamun',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -.3,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/telp.png',
                        width: 12,
                        height: 12,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '01303-527300',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: -.3,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/close.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildMenuItem(
                  icon: 'assets/icons/person.png',
                  title: 'My Doctors',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyDoctorPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: 'assets/icons/record.png',
                  title: 'Medical Records',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicalRecordPage(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: 'assets/icons/payment.png',
                  title: 'Payments',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: 'assets/icons/order.png',
                  title: 'Medicine Orders',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicineOrderPage(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: 'assets/icons/schedule.png',
                  title: 'Test Bookings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DiagnosticTestPage(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: 'assets/icons/privacy.png',
                  title: 'Privacy & Policy',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyPage(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: 'assets/icons/help.png',
                  title: 'Help Center',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpCenterPage(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: 'assets/icons/settings.png',
                  title: 'Settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/images/drawer-background.png',
          width: 120,
          height: 531,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide.none,
      ),
      leading: Image.asset(
        icon,
        width: 20,
        height: 20,
        fit: BoxFit.contain,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: -.3,
          color: Colors.white,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 14,
      ),
      onTap: onTap,
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide.none,
        ),
        leading: Image.asset(
          'assets/icons/logout.png',
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
        title: const Text(
          'Logout',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            letterSpacing: -.3,
            color: Colors.white,
          ),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const LogOutDialog(),
          );
        },
      ),
    );
  }
}
