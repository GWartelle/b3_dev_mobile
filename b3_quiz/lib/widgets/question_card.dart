import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String questionText;
  final String imagePath;
  final VoidCallback onTruePressed;
  final VoidCallback onFalsePressed;

  const QuestionCard({
    Key? key,
    required this.questionText,
    required this.imagePath,
    required this.onTruePressed,
    required this.onFalsePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(imagePath),
            Text(
              questionText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: onTruePressed,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("True",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
                ElevatedButton(
                  onPressed: onFalsePressed,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("False",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
