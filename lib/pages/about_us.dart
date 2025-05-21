import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('من نحن')),
      body: const Center(
        child: Text(
          'هذا التطبيق يهدف إلى رفع الوعي البيئي للبيئة البحرية.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
