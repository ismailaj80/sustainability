import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../pages/beach_vision_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("التوعية البيئية البحرية"),
        backgroundColor: const Color(0xFF00796B), // لون AppBar
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'القائمة',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('الرئيسية'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('كيف نريد شاطئنا'),
              onTap: () {
                Navigator.pop(context); // لإغلاق الـ Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BeachVisionPage()),
                );
              },
            ),



            ListTile(
              title: const Text('من نحن'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // الخلفية الزرقاء
          Container(
            color: const Color(0xFFE0F7FA),
          ),

          // صورة الشعاب المرجانية
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/coral.png'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),

          // المحتوى (النص + الأزرار)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 150), // رفع المحتوى
                  const Text(
                    'اختر الفئة العمرية:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 67, 67),
                      shadows: [
                        Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // الزر الأول
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        await player.play(AssetSource('audio/click.mp3'));
                        Navigator.pushNamed(context, '/level1_7to14');
                      },
                      borderRadius: BorderRadius.circular(16),
                      splashColor: Colors.tealAccent,
                      child: Container(
                        width: 220,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade600,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'من 7 إلى 14 سنة',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // الزر الثاني
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        await player.play(AssetSource('audio/click.mp3'));
                        Navigator.pushNamed(context, '/level1_14plus');
                      },
                      borderRadius: BorderRadius.circular(16),
                      splashColor: Colors.tealAccent,
                      child: Container(
                        width: 220,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade600,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'أكبر من 14 سنة',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
