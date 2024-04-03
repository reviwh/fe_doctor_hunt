import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/search_field.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:flutter/material.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  final _controller = TextEditingController();

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
                "Medicines Orders",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: -0.3,
                  color: darkCharcoal,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SearchField(
              controller: _controller,
              hint: "Search",
              onSubmit: (value) {},
            ),
            Expanded(
                child: ListView(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _gridItem(
                        title: 'Guide to medicine order',
                        icon: 'assets/images/order.png'),
                    _gridItem(
                        title: 'Prescription related issues',
                        icon: 'assets/images/issues.png'),
                    _gridItem(
                        title: 'Order status',
                        icon: 'assets/images/status.png'),
                    _gridItem(
                        title: 'Order delivery',
                        icon: 'assets/images/delivery.png'),
                    _gridItem(
                        title: 'Payments & Refunds',
                        icon: 'assets/images/payment.png'),
                    _gridItem(
                        title: 'Order returns',
                        icon: 'assets/images/return.png'),
                  ],
                ),
              ],
            ))
          ],
        ))
      ],
    ));
  }

  Widget _gridItem({
    String title = "",
    String icon = "",
  }) {
    return Container(
      width: 160,
      height: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
          )
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              width: 76,
              height: 76,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: -0.3,
                color: slateGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
