import 'package:flutter/material.dart';

class AnswerDialog extends StatelessWidget {
  final String message;
  final String gifPath;
  final String funFact;
  final String nextText;
  final VoidCallback onNext;

  const AnswerDialog({
    super.key,
    required this.message,
    required this.gifPath,
    required this.funFact,
    required this.nextText,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              gifPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
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
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  shadowColor: Colors.blue,
                  backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.of(context).pop();
                onNext();
              },
              child: Text(
                nextText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ))
        ],
      ),
    ));
  }
}
