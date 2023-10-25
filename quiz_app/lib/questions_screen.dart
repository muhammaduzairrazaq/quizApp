import 'package:flutter/material.dart';
import 'score_screen.dart';

class QuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Questions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display quiz questions here
            Text('Question 1: What is Flutter?'),
            // Add buttons or options for answering questions
            ElevatedButton(
              onPressed: () {
                // Handle user's answer here
              },
              child: Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle user's answer here
              },
              child: Text('Answer 2'),
            ),
            // Add more questions and answers
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoreScreen()),
                );
              },
              child: Text('Finish Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
