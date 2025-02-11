import 'package:b3_quiz/widgets/scrore_bar.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            ScoreBar(currentScore: 0, questionNumber: 0, totalQuestions: 10),
        body: Center(
          child: Text("QUESTION PAGE"),
        ));
  }
}
