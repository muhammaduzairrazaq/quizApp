import 'package:flutter/material.dart';
import 'package:quiz_app/name_input_screen.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final String name; 
  ScoreScreen({required this.score, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFC466B), Color(0xFF3F5EFB)],
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (score < 4)
                  Image.asset(
                    'assets/badluck.gif', 
                    width: 150,
                    height: 150,
                  ),
                if (score >= 4)
                  Image.asset(
                    'assets/congratulations.gif', 
                    width: 150,
                    height: 150,
                  ),
                SizedBox(height: 15),
                Text(
                  score >= 4 ? 'Congratulations $name !' : 'Better Luck $name !',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Your Score : $score',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NameInputScreen()),
                    );
                  },
                  child: Container(
                    width: 100, 
                    height: 40, 
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text('Start Again'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
