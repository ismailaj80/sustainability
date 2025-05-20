import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data/questions.dart';
import '../widgets/app_scaffold.dart';
import 'home_page.dart';

class PostTestPage extends StatefulWidget {
  const PostTestPage({super.key});

  @override
  _PostTestPageState createState() => _PostTestPageState();
}

class _PostTestPageState extends State<PostTestPage> {
  final player = AudioPlayer();
  final questions = postTestQuestions;

  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  String? selectedOption;
  bool answered = false;
  bool finished = false;

  void checkAnswer(String selected) {
    if (!answered) {
      setState(() {
        selectedOption = selected;
      });
    }
  }

  void nextQuestion() async {
    if (selectedOption == questions[currentQuestionIndex]['answer']) {
      correctAnswers++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
        answered = false;
      });
    } else {
      double percentage = correctAnswers / questions.length;
      setState(() {
        finished = true;
      });

      if (percentage >= 0.5) {
        await player.play(AssetSource('audio/success.mp3'));
      } else {
        await player.play(AssetSource('audio/failure.mp3'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (finished) {
      return AppScaffold(
        title: 'الاختبار البعدي',
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تم إكمال الاختبار بنجاح.\nأجبت بشكل صحيح على $correctAnswers من ${questions.length}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                child: Text('العودة إلى الصفحة الرئيسية'),
              ),
            ],
          ),
        ),
      );
    }

    final question = questions[currentQuestionIndex];

    return AppScaffold(
      title: 'الاختبار البعدي',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('السؤال ${currentQuestionIndex + 1} من ${questions.length}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(question['question'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ...question['options'].map<Widget>((option) {
              final isSelected = option == selectedOption;
              final isCorrect = option == question['answer'];
              Color? color;

              if (answered || selectedOption != null) {
                if (isSelected) {
                  color = isCorrect ? Colors.green : Colors.red;
                } else if (isCorrect) {
                  color = Colors.green.shade200;
                }
              }

              return Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: answered ? null : () => checkAnswer(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color ?? Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(option, style: TextStyle(fontSize: 18)),
                ),
              );
            }).toList(),
            if (selectedOption != null)
              SizedBox(height: 20),
            if (selectedOption != null)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    answered = true;
                  });
                  Future.delayed(Duration(milliseconds: 200), nextQuestion);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text('السؤال التالي'),
              ),
          ],
        ),
      ),
    );
  }
}
