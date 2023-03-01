import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//_ -> cont be manipulated from outside. Private vars/class
// special syntax in dart
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  var _quesIndex = 0;
  var questions = [
    'What is your favorite color?',
    'What is your favorite animal?',
  ];

  void _answerQuestion() {
    setState(() {
      _quesIndex = (++_quesIndex) % questions.length;
    });
    print('Answer Chosen');
    print(_quesIndex);
    print(questions[_quesIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(questions.elementAt(_quesIndex)),
            ElevatedButton(
              onPressed: _answerQuestion,
              child: Text('answer 1'),
            ),
            ElevatedButton(
              onPressed: _answerQuestion,
              child: Text('answer 2'),
            ),
            ElevatedButton(
              onPressed: () => {
                print('answer 3 chosen'),
              },
              child: Text('answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
