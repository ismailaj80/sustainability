import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/app_scaffold.dart';

class Level1_7to14 extends StatefulWidget {
  const Level1_7to14({super.key});

  @override
  State<Level1_7to14> createState() => _Level1_7to14State();
}

class _Level1_7to14State extends State<Level1_7to14> {
  int currentQuestion = 0;
  int correctAnswers = 0;
  bool quizFinished = false;

  final AudioPlayer player = AudioPlayer();

  final List<Map<String, dynamic>> questions = [
    {
      'images': [
        'assets/images/aqaba_beach1.jpg',
        'assets/images/aqaba_beach2.jpg',
        'assets/images/aqaba_beach3.jpg',
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
    {
      'images': [
        'assets/images/q4_bad1.jpg',
        'assets/images/q4_bad2.jpg',
        'assets/images/q4_good.jpg',
      ],
      'correctIndex': 2,
    },
    {
      'images': [
        'assets/images/q5_bad1.jpg',
        'assets/images/q5_good.jpg',
        'assets/images/q5_bad2.jpg',
      ],
      'correctIndex': 1,
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

      // تأخير تشغيل الصوت بعد عرض النتيجة
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
    return AppScaffold(
      title: 'المستوى الأول - من 7 إلى 14 سنة',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: quizFinished
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      correctAnswers >= 3 ? Icons.check_circle : Icons.cancel,
                      color: correctAnswers >= 3 ? Colors.green : Colors.red,
                      size: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      correctAnswers >= 3
                          ? 'أحسنت! لقد نجحت في هذا المستوى ✅'
                          : 'لم تنجح في هذا المستوى ❌ حاول مرة أخرى',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    correctAnswers >= 3
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/level2_7to14');
                            },
                            child: const Text('انتقل إلى المستوى الثاني'),
                          )
                        : Column(
                            children: [
                              ElevatedButton(
                                onPressed: resetQuiz,
                                child: const Text('إعادة المحاولة'),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/tips');
                                },
                                child: const Text('ارشادات وتعليمات'),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            : Column(
                children: [
                  Text(
                    'السؤال ${currentQuestion + 1} من ${questions.length}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
