import 'package:b3_quiz/models/question.dart';
import 'package:b3_quiz/models/quiz_data.dart';
import 'package:b3_quiz/pages/result_page.dart';
import 'package:b3_quiz/widgets/question_card.dart';
import 'package:b3_quiz/widgets/scrore_bar.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int currentScore = 0;
  int currentQuestionIndex = 0;

  List<Question> questions = QuizData.questions;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questions[currentQuestionIndex].answer;
    if (userAnswer == correctAnswer) {
      setState(() {
        currentScore++;
      });
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              finalScore: currentScore,
              totalQuestions: questions.length,
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ScoreBar(
            currentScore: currentScore,
            currentQuestionIndex: currentQuestionIndex + 1,
            totalQuestions: questions.length),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuestionCard(
                          questionText: questions[currentQuestionIndex].text,
                          imagePath: questions[currentQuestionIndex].imagePath,
                          onTruePressed: () => checkAnswer(true),
                          onFalsePressed: () => checkAnswer(false))
                    ]))));
  }
}
