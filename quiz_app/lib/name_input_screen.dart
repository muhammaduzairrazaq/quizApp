import 'package:flutter/material.dart';
import 'questions_screen.dart';

class NameInputScreen extends StatefulWidget {
  
  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  TextEditingController _nameController = TextEditingController();
  bool _isNameEntered = false;
  String playerName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFC466B),
              Color(0xFF3F5EFB),
            ],
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
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Enter your information below',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 150.0),
              Container(
                width: 350.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: TextField(
                      controller: _nameController,
                      onChanged: (value) {
                        setState(() {
                          _isNameEntered = value.isNotEmpty;
                          playerName = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your name',
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100.0),
              InkWell(
                onTap: _isNameEntered
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuestionsScreen(pname: playerName,)),
                        );
                      }
                    : null,
                child: Container(
                  width: 350.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                    borderRadius: BorderRadius.circular(20.0),
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
