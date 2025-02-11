import 'package:b3_quiz/pages/question_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "The extreme quiz",
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
                      Image.network(
                          'https://images.unsplash.com/photo-1517258307935-9764dad5d7de?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      Text(
                        "Are you ready to take on a challenge?!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 4,
                            shadowColor: Colors.blue,
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionPage(),
                              ));
                        },
                        child: Text(
                          "Try the extreme quiz!!!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
