import 'package:flutter/material.dart';

class AnswerDialog extends StatelessWidget {
  final String message;
  final String gifPath;
  final String funFact;
  final String nextText;
  final VoidCallback onNext;

  const AnswerDialog({
    Key? key,
    required this.message,
    required this.gifPath,
    required this.funFact,
    required this.nextText,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Column(
      children: [
        Image.network(gifPath),
        Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Funfact : ",
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          funFact,
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onNext();
            },
            child: Text(nextText))
      ],
    ));
  }
}
