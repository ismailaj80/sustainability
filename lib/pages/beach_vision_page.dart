import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart'; // ← استدعاء AppScaffold

class BeachVisionPage extends StatelessWidget {
  const BeachVisionPage({super.key});

  final List<Map<String, String>> beachImages = const [
    {'path': 'assets/images/aqaba_beach1.jpg', 'caption': 'شاطئ نظيف ومثالي'},
    {'path': 'assets/images/aqaba_beach2.jpg', 'caption': 'الحفاظ على جمال الطبيعة'},
    {'path': 'assets/images/aqaba_beach3.jpg', 'caption': 'لا نفايات في الشاطئ'},
    {'path': 'assets/images/coral1.jpg', 'caption': 'الشعاب المرجانية كنز بيئي'},
    {'path': 'assets/images/coral_fish.jpg', 'caption': 'الحياة البحرية تزدهر بالنظافة'},
    {'path': 'assets/images/diving1.jpg', 'caption': 'متعة الغوص في بيئة نقية'},
    {'path': 'assets/images/diving2.jpg', 'caption': 'احترام الكائنات البحرية'},
    {'path': 'assets/images/coral5.jpg', 'caption': 'التوازن البيئي مسؤوليتنا'},
    {'path': 'assets/images/aqaba_beach5.jpg', 'caption': 'لنترك المكان أفضل مما وجدناه'},
    {'path': 'assets/images/aqaba_beach6.jpg', 'caption': 'بيئة بحرية آمنة للأطفال'},
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'كيف نريد شاطئنا',
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: beachImages.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final image = beachImages[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      image['path']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Text(
                    image['caption']!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
