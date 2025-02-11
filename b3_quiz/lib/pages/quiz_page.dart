import 'package:b3_quiz/models/question.dart';
import 'package:b3_quiz/models/quiz_data.dart';
import 'package:b3_quiz/pages/result_page.dart';
import 'package:b3_quiz/widgets/answer_dialog.dart';
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
    String message;
    String gifPath;
    String nextText;

    if (userAnswer == correctAnswer) {
      setState(() {
        currentScore++;
      });
      message = "Correct! Well done.";
      gifPath =
          "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExNmo5YzYyY29ucm9oa2VsMW1oZml5MTRuM3pmczV1bTMxOXljYWd2ZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/tIeCLkB8geYtW/giphy.gif";
    } else {
      message = "Oops! That's wrong.";
      gifPath =
          "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbDJxZ3Nkc2g0aXk3d3d4a2xvMHN4OXl3Y3dkc2p3dnZ0NjN5MXlhbCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YTJXDIivNMPuNSMgc0/giphy.gif";
    }

    if (currentQuestionIndex < questions.length - 1) {
      nextText = "Next question";
    } else {
      nextText = "See the results";
    }

    void nextQuestion() {
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

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnswerDialog(
          message: message,
          gifPath: gifPath,
          funFact: questions[currentQuestionIndex].funFact,
          nextText: nextText,
          onNext: nextQuestion,
        );
      },
    );
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
