import 'package:flutter/material.dart';

class ScoreBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentScore;
  final int questionNumber;
  final int totalQuestions;

  const ScoreBar({
    required this.currentScore,
    required this.questionNumber,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Question number $questionNumber/$totalQuestions",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "Score: $currentScore/$totalQuestions",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      toolbarHeight: 50.0,
      centerTitle: true,
      elevation: 4,
      backgroundColor: Colors.blue,
      shadowColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
