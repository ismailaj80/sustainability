import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/app_scaffold.dart';

class Level3_7to14 extends StatefulWidget {
  const Level3_7to14({super.key});

  @override
  State<Level3_7to14> createState() => _Level3_7to14State();
}

class _Level3_7to14State extends State<Level3_7to14> {
  int currentQuestion = 0;
  int correctAnswers = 0;
  bool quizFinished = false;

  final AudioPlayer player = AudioPlayer();

  final List<Map<String, dynamic>> questions = [
    {
      'images': [
        'assets/images/q1_bad1.jpg',
        'assets/images/q1_bad2.jpg',
        'assets/images/q1_good.jpg',
      ],
      'correctIndex': 2, 
    },
    {
      'images': [
        'assets/images/q2_bad1.jpg',
        'assets/images/q2_good.jpg',
        'assets/images/q2_bad2.jpg',
      ],
      'correctIndex': 1,
    },
    {
      'images': [
        'assets/images/q3_good.jpg',
        'assets/images/q3_bad1.jpg',
        'assets/images/q3_bad2.jpg',
      ],
      'correctIndex': 0,
    },
  ];

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestion]['correctIndex']) {
      correctAnswers++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      setState(() {
        quizFinished = true;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        if (correctAnswers >= 3) {
          player.play(AssetSource('audio/success.mp3'));
        } else {
          player.play(AssetSource('audio/failure.mp3'));
        }
      });
    }
  }

  void resetQuiz() {
    setState(() {
      currentQuestion = 0;
      correctAnswers = 0;
      quizFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizFinished) {
      final bool passed = correctAnswers >= 3;
      return AppScaffold(
        title: 'المستوى الثالث - من 7 إلى 14 سنة',
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade50, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                passed ? 'assets/images/000.gif' : 'assets/images/fail.gif',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                passed
                    ? 'أحسنت! لقد نجحت في هذا المستوى'
                    : 'لم تنجح في هذا المستوى، حاول مرة أخرى',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'الإجابات الصحيحة: $correctAnswers من ${questions.length}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 30),
              passed
                  ? ElevatedButton.icon(
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                    },
                    label: const Text('العودة إلى الصفحة الرئيسية'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  )
                  : Column(
                    children: [
                      ElevatedButton(
                        onPressed: resetQuiz,
                        child: const Text('إعادة المحاولة'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/tips');
                        },
                        child: const Text('ارشادات وتعليمات'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      );
    }

    return AppScaffold(
      title: 'المستوى الثالث - من 7 إلى 14 سنة',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'السؤال ${currentQuestion + 1} من ${questions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => checkAnswer(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        questions[currentQuestion]['images'][index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
