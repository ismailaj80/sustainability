import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/level1_7to14.dart';
import 'pages/level2_7to14.dart';
import 'pages/tips_page.dart';
import 'pages/about_us.dart';
import 'pages/beach_vision_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق الوعي البيئي',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Cairo',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/level1_7to14': (context) => const Level1_7to14(),
        '/level2_7to14': (context) => const Level2_7to14(),
        '/tips': (context) => const TipsPage(),
        '/about': (context) => const AboutUs(),
        '/beach_vision': (context) => const BeachVisionPage(),
      },
    );
  }
}
