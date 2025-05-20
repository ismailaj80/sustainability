import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class Level2_7to14 extends StatelessWidget {
  const Level2_7to14({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'المستوى الثاني - من 7 إلى 14 سنة',
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 40),
            Icon(Icons.school, size: 100, color: Colors.teal),
            SizedBox(height: 30),
            Text(
              'مرحبًا بك في المستوى الثاني!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'سيتم قريبًا إضافة محتوى تفاعلي جديد يختبر مهاراتك في الحفاظ على البيئة البحرية.\nابقَ مستعدًا!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
