import 'package:b3_quiz/widgets/question_card.dart';
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
            child: QuestionCard(
                questionText: "This is the question",
                imagePath:
                    "https://unsplash.com/photos/man-in-white-t-shirt-and-brown-pants-riding-skateboard-on-brown-sand-during-daytime-r1SwcagHVG0",
                onTruePressed: () => {print("TRUE")},
                onFalsePressed: () => {print("FALSE")})));
  }
}
