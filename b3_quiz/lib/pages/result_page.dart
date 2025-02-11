import 'package:b3_quiz/pages/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int finalScore;
  final int totalQuestions;

  const ResultPage({
    super.key,
    required this.finalScore,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double averageScore = totalQuestions / 2;
    String imageUrl = finalScore >= averageScore
        ? 'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExNGg0c3plYTRvbG90MjJ6YnpicTNnYWVoZzNwM29mNjQxbDdmOXozbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Ta2eHM043vhVS/giphy.gif'
        : 'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExcnRqMmhncnk1M3Q4NmRxM3VkYXRkNmhvZzFsMXFpOTdmdGR4OHN6MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/11tTNkNy1SdXGg/giphy.gif';

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Thanks for playing!",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          elevation: 4,
          backgroundColor: Colors.blue,
          shadowColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                shadowColor: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              },
                            ),
                          )),
                      const SizedBox(height: 16),
                      Text(
                        "Your total score is $finalScore/$totalQuestions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 4,
                            shadowColor: Colors.blue,
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        },
                        child: Text(
                          "Try again?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
