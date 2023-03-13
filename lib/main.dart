import 'package:flutter/material.dart';
import 'package:quiz/widgets/result.dart';
// import 'package:quiz/widgets/answer.dart';
// import './widgets/question.dart';
import './widgets/quiz.dart'; //2 levels of state uplifting

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
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': ['Black', 'White', 'Red', 'Green'],
    },
    {
      'questionText': 'What is your favorite animal and why is it dog?',
      'answers': ['Dog', 'Cat', 'Rat', 'Lion'],
    },
    {
      'questionText': 'What\'s is your favourite hobby?',
      'answers': ['Books', 'Code', 'Memes', 'Sleep'],
    }
  ];

  void _answerQuestion() {
    if (_quesIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
    setState(() {
      _quesIndex = ++_quesIndex;
    });
    print(_quesIndex);
    // print(questions[_quesIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: _quesIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                quesIndex: _quesIndex)
            : Result(),
      ),
    );
  }
}
