import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/components/primary_button.dart';
import 'package:doctor_hunt/screens/record.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AddRecordPage extends StatefulWidget {
  const AddRecordPage({super.key});

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  final TextEditingController _forController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  RecordType _recordType = RecordType.report;

  String _getText(DateTime date) =>
      '${DateFormat('d MMM').format(date)}, ${date.year}';

  @override
  void initState() {
    super.initState();
    _forController.text = 'Abdullah Mamun';
    _dateController.text = _getText(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
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
              'Add Records',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: -.3,
                color: darkCharcoal,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Wrap(
                    runSpacing: 16,
                    spacing: 16,
                    children: [
                      _buildImage(imagePath: 'assets/images/patient-1.jpg'),
                      _buildImage(onTap: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 480),
        ],
      )),
      Positioned(
        bottom: 0,
        child: _buildForm(),
      )
    ]));
  }

  Widget _buildImage({String? imagePath, Function()? onTap}) {
    return Container(
      width: 100,
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: green.withOpacity(.2),
        image: imagePath != null
            ? DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: imagePath == null
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_rounded, size: 28, color: green),
                    Text(
                      "Add more images",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: -.3,
                        color: green,
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildForm() {
    Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: 480,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 20,
          )
        ],
      ),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          _buildField(
            label: 'Record for',
            value: _forController.text,
            onPressed: () {},
          ),
          _buildTypeOfRecordField(),
          _buildField(
            label: "Record created on",
            value: _dateController.text,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomPrimaryButton(
              text: "Upload Record",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecordPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    String label = "",
    String value = "",
    required onPressed,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: -.3,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -.3,
                    color: green,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.edit_rounded,
                size: 14,
                color: slateGray,
              ),
            ),
          ],
        ),
        Divider(
          height: 32,
          thickness: .8,
          color: Colors.black.withOpacity(.1),
        ),
      ],
    );
  }

  Widget _buildTypeOfRecordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Type of record',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            letterSpacing: -.3,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 32,
          runSpacing: 8,
          children: [
            _buildTypeOfRecordItem(
              icon: 'assets/icons/report.svg',
              title: 'Report',
              isSelected: _recordType == RecordType.report,
              onTap: () {
                setState(() {
                  _recordType = RecordType.report;
                });
              },
            ),
            _buildTypeOfRecordItem(
              icon: 'assets/icons/prescription.svg',
              title: 'Prescription',
              isSelected: _recordType == RecordType.prescription,
              onTap: () {
                setState(() {
                  _recordType = RecordType.prescription;
                });
              },
            ),
            _buildTypeOfRecordItem(
              icon: 'assets/icons/invoice.svg',
              title: 'Invoice',
              isSelected: _recordType == RecordType.invoice,
              onTap: () {
                setState(() {
                  _recordType = RecordType.invoice;
                });
              },
            ),
          ],
        ),
        Divider(
          height: 42,
          thickness: .8,
          color: Colors.black.withOpacity(.1),
        ),
      ],
    );
  }

  Widget _buildTypeOfRecordItem({
    String icon = '',
    String title = '',
    bool isSelected = false,
    required Function() onTap,
  }) {
    Color color = isSelected ? green : slateGray;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(2),
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: -.3,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
