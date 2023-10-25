import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Congratulations! Quiz Completed.'),
            Text('Your Score: 8/10'), // Display the user's score here
            ElevatedButton(
              onPressed: () {
                // You can navigate back to the Name Input screen or do any other action
                Navigator.pop(context);
              },
              child: Text('Start Again'),
            ),
          ],
        ),
      ),
    );
  }
}
