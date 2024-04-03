import 'package:flutter/material.dart';

List<Map<String, dynamic>> onboardSliders = [
  {
    "image": "assets/images/onboard-1.jpg",
    "title": "Find Trusted Doctors",
    "description":
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  },
  {
    "image": "assets/images/onboard-2.jpg",
    "title": "Choose Best Doctors",
    "description":
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  },
  {
    "image": "assets/images/onboard-3.jpg",
    "title": "Easy Appointments",
    "description":
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  },
];

final List<Map<String, dynamic>> times = [
  {
    'time': DateTime.now(),
    'slot': 0,
    'type': TimeCardType.unavailable,
    'slotTime': null,
  },
  {
    'time': DateTime.now().add(const Duration(days: 1)),
    'slot': 9,
    'type': TimeCardType.available,
    'slotTime': {
      'afternoon': [
        '1.00 PM',
        '1.30 PM',
        '2.00 PM',
        '2.30 PM',
        '3.00 PM',
        '3.30 PM',
        '4.00 PM'
      ],
      'evening': ['5.00 PM', '5.30 PM', '6.00 PM', '6.30 PM', '7.00 PM'],
    },
  },
  {
    'time': DateTime.now().add(const Duration(days: 2)),
    'slot': 10,
    'type': TimeCardType.disabled,
    'slotTime': null,
  },
];

List availableTimes = [
  {
    'time': '10:00',
    'timeFormat': 'AM',
  },
  {
    'time': '12:00',
    'timeFormat': 'AM',
  },
  {
    'time': '02:00',
    'timeFormat': 'PM',
  },
  {
    'time': '03:00',
    'timeFormat': 'PM',
  },
  {
    'time': '04:00',
    'timeFormat': 'PM',
  },
];

List<Map<String, int>> reminders = [
  {'minutes': 30},
  {'minutes': 40},
  {'minutes': 25},
  {'minutes': 10},
  {'minutes': 35},
];

List<String> liveImages = [
  "assets/images/live-1.jpg",
  "assets/images/live-2.jpg",
  "assets/images/live-3.jpg",
];

List<Map<String, dynamic>> popularDoctorsHome = [
  {
    "image": "assets/images/doc-3.jpg",
    "name": "Dr. Fillerup Grab",
    "speciality": "Medicine Specialist",
  },
  {
    "image": "assets/images/doc-2.jpg",
    "name": "Dr. Blessing",
    "speciality": "Dentist Specialist",
  }
];
List<Map<String, dynamic>> comments = [
  {
    'image': 'assets/images/patient-1.jpg',
    'name': 'Comfort Love',
    'msg': 'Depending on their education 😯'
  },
  {
    'image': 'assets/images/user-3.jpg',
    'name': ' Everhart Tween',
    'msg': 'This is the largest directory 👍'
  },
  {
    'image': 'assets/images/profile.jpg',
    'name': 'Bonebrake Mash',
    'msg': 'They treat immune system disorders'
  },
  {
    'image': 'assets/images/user-2.jpg',
    'name': 'Everhart Tween',
    'msg': 'Thanks for shareing doctor 🩷'
  },
];

List findDoctors = [
  {
    'image': 'assets/images/doc-2.jpg',
    'isFavorite': true,
    'name': 'Dr. Shruti Kedia',
    'speciality': 'Tooth Dentist',
    'exp': 7,
    'percentage': 87,
    'patientStories': 67,
    'nextAvailable': '10:00 AM tommorow',
  },
  {
    'image': 'assets/images/doc-9.jpg',
    'isFavorite': false,
    'name': 'Dr. Watamaniuk',
    'speciality': 'Tooth Dentist',
    'exp': 9,
    'percentage': 74,
    'patientStories': 78,
    'nextAvailable': '12:00 AM tommorow',
  },
  {
    'image': 'assets/images/doc-1.jpg',
    'isFavorite': true,
    'name': 'Dr. Crownover',
    'speciality': 'Tooth Dentist',
    'exp': 5,
    'percentage': 59,
    'patientStories': 86,
    'nextAvailable': '11:00 AM tommorow',
  },
  {
    'image': 'assets/images/doc-2.jpg',
    'isFavorite': false,
    'name': 'Dr. Balestra',
    'speciality': 'Tooth Dentist',
    'exp': 6,
    'percentage': 87,
    'patientStories': 69,
    'nextAvailable': '10:00 AM tommorow',
  },
];

List myDoctor = [
  {
    'image': 'assets/images/doc-2.jpg',
    'isFavorite': false,
    'name': 'Dr. Tranquilli',
    'speciality': 'Specialist Medicine',
    'exp': 6,
    'percentage': 87,
    'patientStories': 69,
    'nextAvailable': '10:00 AM tommorow',
  },
  {
    'image': 'assets/images/doc-9.jpg',
    'isFavorite': true,
    'name': 'Dr. Bonebrake',
    'speciality': 'Specialist Dentist',
    'exp': 8,
    'percentage': 59,
    'patientStories': 82,
    'nextAvailable': '12:00 AM tommorow',
  },
  {
    'image': 'assets/images/doc-1.jpg',
    'isFavorite': false,
    'name': 'Dr. Luke Whitesell',
    'speciality': 'Specialist Cardiologist',
    'exp': 7,
    'percentage': 57,
    'patientStories': 76,
    'nextAvailable': '11:00 AM tommorow',
  },
  {
    'image': 'assets/images/doc-2.jpg',
    'isFavorite': true,
    'name': 'Dr. Shoemaker',
    'speciality': 'Specialist Patheology',
    'exp': 5,
    'percentage': 87,
    'patientStories': 69,
    'nextAvailable': '10:00 AM tommorow',
  },
];

List<Map<String, dynamic>> doctors = [
  {
    "images": "assets/images/doc-6.jpg",
    "name": "Dr. Pediatrician",
    "speciality": "Specialist Cardiologist",
    "rating": 2.8,
    "views": 2821,
    "isFavorited": true,
  },
  {
    "images": "assets/images/doc-5.jpg",
    "name": "Dr. Mistry Brick",
    "speciality": "Specialist Dentist",
    "rating": 2.8,
    "views": 2821,
    "isFavorited": true,
  },
  {
    "images": "assets/images/doc-4.jpg",
    "name": "Dr. Ether Wall",
    "speciality": "Specialist Cancer",
    "rating": 2.8,
    "views": 2821,
    "isFavorited": true,
  },
  {
    "images": "assets/images/doc-8.jpg",
    "name": "Dr. Johan Smith",
    "speciality": "Specialist Cardiologist",
    "rating": 2.8,
    "views": 2821,
    "isFavorited": true,
  },
  {
    "images": "assets/images/doc-8.jpg",
    "name": "Dr. Johan Smith",
    "speciality": "Specialist Cardiologist",
    "rating": 2.8,
    "views": 2821,
    "isFavorited": true,
  },
  {
    "images": "assets/images/doc-4.jpg",
    "name": "Dr. Ether Wall",
    "speciality": "Specialist Cancer",
    "rating": 2.8,
    "views": 2821,
    "isFavorited": true,
  },
];

List<Map<String, dynamic>> doctorsInGrid = [
  {
    "images": "assets/images/doc-4.jpg",
    "name": "Dr. Shouey",
    "speciality": "Specalist Cardiology",
    "isFavourite": false,
  },
  {
    "images": "assets/images/doc-3.jpg",
    "name": "Dr. Christenfeld N",
    "speciality": "Specalist Cancer",
    "isFavourite": true,
  },
  {
    "images": "assets/images/doc-2.jpg",
    "name": "Dr. Shouey",
    "speciality": "Specalist Medicine",
    "isFavourite": true,
  },
  {
    "images": "assets/images/doc-1.jpg",
    "name": "Dr. Shouey",
    "speciality": "Specalist Dentist",
    "isFavourite": false,
  },
];

List<Map<String, dynamic>> featuredDoctors = [
  {
    "images": "assets/images/doc-4.jpg",
    "name": "Dr. Crick",
    "rating": 3.7,
    "price": 25.00,
    "isFavorited": false,
  },
  {
    "images": "assets/images/doc-5.jpg",
    "name": "Dr. Strain",
    "rating": 3.0,
    "price": 22.00,
    "isFavorited": true,
  },
  {
    "images": "assets/images/doc-6.jpg",
    "name": "Dr. Lachinet",
    "rating": 2.9,
    "price": 29.00,
    "isFavorited": false,
  },
  {
    "images": "assets/images/doc-4.jpg",
    "name": "Dr. Crick",
    "rating": 3.0,
    "price": 25.00,
    "isFavorited": true,
  },
];

List<Map<String, dynamic>> popularDoctor = [
  {
    "images": "assets/images/doc-7.jpg",
    "name": "Dr. Truluck Nik",
    "speciality": "Medicine Specialist",
  },
  {
    "images": "assets/images/doc-8.jpg",
    "name": "Dr. Tranquilli",
    "speciality": "Patheology Specialist",
  },
  {
    "images": "assets/images/doc-5.jpg",
    "name": "Dr. Truluck Nik",
    "speciality": "Medicine Specialist",
  },
];

List<Map<String, dynamic>> doctorByCategories = [
  {
    "images": "assets/images/doc-6.jpg",
    "name": "Dr. Pediatrician",
    "speciality": "Specialist Cardiologist",
    "rating": 2.4,
    "views": 2475,
    "isFavorited": true,
  },
  {
    "images": "assets/images/doc-5.jpg",
    "name": "Dr. Mistry Brick",
    "speciality": "Specialist Dentist",
    "rating": 2.8,
    "views": 2893,
    "isFavorited": false,
  },
  {
    "images": "assets/images/doc-4.jpg",
    "name": "Dr. Ether Wall",
    "speciality": "Specialist Cancer",
    "rating": 2.7,
    "views": 2754,
    "isFavorited": true,
  },
  {
    "images": "assets/images/doc-8.jpg",
    "name": "Dr. Johan Smith",
    "speciality": "Specialist Cardiologist",
    "rating": 2.8,
    "views": 2821,
    "isFavorited": false,
  },
];

final DateTime today = DateUtils.dateOnly(DateTime.now());

List<Map<String, dynamic>> diagnosticTests = [
  {
    "title": "Advanced Young Indian Health Checkup",
    "subtitle": "Ideal for individuals aged 21-40 years",
    "numsOfTest": 69,
    "image": 'assets/images/test-1.jpg',
    "regularPrice": 358,
    "discountPrice": 330,
    "discount": 35,
    "additional": "+ 10% Health cashback T&C"
  },
  {
    "title": "Working Women's Health Checkup",
    "subtitle": "Ideal for individuals aged 21-40 years",
    "numsOfTest": 119,
    "image": 'assets/images/test-2.jpg',
    "regularPrice": 387,
    "discountPrice": 345,
    "discount": 35,
    "additional": "+ 10% Health cashback T&C"
  },
  {
    "title": "Active Professional Health Checkup",
    "subtitle": "Ideal for individuals aged 21-40 years",
    "numsOfTest": 100,
    "image": 'assets/images/test-3.jpg',
    "regularPrice": 457,
    "discountPrice": 411,
    "discount": 35,
    "additional": "+ 10% Health cashback T&C"
  },
];

List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

List<int> getDays() {
  List<int> days = [];
  for (int i = 1; i <= 31; i++) {
    days.add(i);
  }
  return days;
}

List<int> getYears() {
  List<int> years = [];
  for (int i = 1900; i <= 2024; i++) {
    years.add(i);
  }
  return years;
}

List<String> services = const [
  'Patient care should be the number one priority',
  'If you run your practiceyou know how.',
  'Thats why some of appointment reminder.',
];

List patients = [
  {
    'image': 'assets/images/patient-1.jpg',
    'name': 'My Self',
  },
  {
    'image': 'assets/images/patient-3.jpg',
    'name': 'My child',
  },
  {
    'image': 'assets/images/patient-2.jpg',
    'name': 'My wife',
  },
];

List records = [
  {
    'date': DateTime(2024, 2, 27),
    'by': 'you',
    'to': 'Abdullah Mamun',
    'prescription': 1,
    'isNew': true,
  },
  {
    'date': DateTime(2024, 2, 28),
    'by': 'you',
    'to': 'Abdullah Shuvo',
    'prescription': 1,
    'isNew': true,
  },
  {
    'date': DateTime(2024, 3, 1),
    'by': 'you',
    'to': 'Shruti Kedia',
    'prescription': 1,
    'isNew': true,
  },
];

enum Gender { male, female, others }

enum TimeCardType { available, unavailable, disabled }

enum RecordType { report, prescription, invoice }
