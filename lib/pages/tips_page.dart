import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'إرشادات وتعليمات',
      body: const Center(
        child: Text('سيتم وضع فيديو توعوي هنا.'),
      ),
    );
  }
}
