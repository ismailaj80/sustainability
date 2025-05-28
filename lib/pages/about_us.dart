import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2), // من الأسفل قليلاً
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(0);
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'من نحن',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'تم تطوير هذا التطبيق من قبل فريق الوعي البيئي في مدرسة الأردن الثانوية الشاملة للبنين – محافظة العقبة.',
                      style: TextStyle(fontSize: 18, height: 1.6),
                    ),
                    SizedBox(height: 24),
                    sectionTitle('الفريق الأساسي:'),
                    bullet('سليم مهيدات (مدير المدرسة)'),
                    bullet('إسماعيل أبو جحيشة'),
                    bullet('أحمد حمدان'),
                    bullet('منتصر رضوان'),
                    bullet('عبد الله قباعة'),
                    bullet('عماد الصلاحات'),
                    SizedBox(height: 24),
                    sectionTitle('فريق تكنولوجيا المعلومات (BTEC):'),
                    bullet('حمزة الكردي'),
                    bullet('عمر حاوي'),

                    SizedBox(height: 24),
                    sectionTitle('إشراف:'),
                    Text(
                      'الأستاذ فايز أبو معلا – أكاديمية الملكة رانيا لتدريب المعلمين',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade900.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Version 2.0.0',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text('• ', style: TextStyle(fontSize: 20)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 18))),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.green.shade800,
      ),
    );
  }
}
