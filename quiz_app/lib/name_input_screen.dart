import 'package:flutter/material.dart';
import 'questions_screen.dart';

class NameInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFC466B),
              Color(0xFF3F5EFB)
            ], // Use Color constructor for custom colors
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Let\'s Play Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0, // Large title font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0), // Add some vertical spacing
              Text(
                'Enter your information below',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 150.0), // Add more vertical spacing
              Container(
                width: 400.0, // Adjust the width as needed
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0), // Rounded borders
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    // Center the TextField vertically
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your name',
                      ),
                      style: TextStyle(
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100.0), // Add more vertical spacing
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionsScreen()),
                  );
                },
                child: Container(
                  width: 400.0, // Button width
                  height: 60.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple], // Gradient colors
                    ),
                    borderRadius:
                        BorderRadius.circular(20.0), // Rounded borders
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Start Quiz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
