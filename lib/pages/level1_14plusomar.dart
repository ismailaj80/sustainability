// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import 'home_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int level = 0;
  int currentQuestion = 0;
  int correctAnswers = 0;
  List<String?> selectedAnswers = List.filled(5, null);

  void checkAnswer() {
    if (selectedAnswers[currentQuestion] ==
        levelQuestions[level][currentQuestion]["correct"]) {
      correctAnswers++;
    }

    if (currentQuestion == 4) {
      showResultPage();
    } else {
      setState(() {
        currentQuestion++;
      });
    }
  }

  void showResultPage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text("النتيجة", textAlign: TextAlign.right),
              content: Text(
                "عدد الإجابات الصحيحة: $correctAnswers من 5",
                textAlign: TextAlign.right,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedAnswers = List.filled(5, null);
                      currentQuestion = 0;
                      correctAnswers = 0;
                    });
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("إعادة المحاولة"),
                ),
                if (correctAnswers >= 3 && level < 2)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        level++;
                        selectedAnswers = List.filled(5, null);
                        currentQuestion = 0;
                        correctAnswers = 0;
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("الانتقال للمستوى التالي"),
                  ),
                if (correctAnswers >= 3 && level == 2)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("الرجوع للصفحة الرئيسية"),
                  ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final questions = levelQuestions[level];
    final bgImages = [
      'assets/images/bg1.jpeg',
      'assets/images/bg2.jpg',
      'assets/images/bg3.jpg',
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(levelTitles[level]),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImages[level]),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "السؤال ${currentQuestion + 1}: ${questions[currentQuestion]["question"]}",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 20),
                  ...questions[currentQuestion]["answers"].map<Widget>((
                    answer,
                  ) {
                    return RadioListTile<String>(
                      title: Text(
                        answer,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                        ),
                        textAlign: TextAlign.right,
                      ),
                      value: answer,
                      groupValue: selectedAnswers[currentQuestion],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[currentQuestion] = value;
                        });
                      },
                      visualDensity: const VisualDensity(vertical: 4),
                    );
                  }).toList(),
                  const SizedBox(height: 10),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed:
                              selectedAnswers[currentQuestion] == null
                                  ? null
                                  : checkAnswer,
                          child: const Text("تأكيد الإجابة"),
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
    );
  }
}
