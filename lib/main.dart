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
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your favorite animal and why is it dog?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Rat', 'score': 3},
        {'text': 'Dog', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s is your favourite hobby?',
      'answers': [
        {'text': 'Books', 'score': 10},
        {'text': 'Code', 'score': 5},
        {'text': 'Memes', 'score': 3},
        {'text': 'Sleep', 'score': 1}
      ],
    }
  ];

  void _resetQuiz(){
    setState(() {
      _quesIndex=0;
      _totalScore=0;      
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
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
            : Result(resultScore:_totalScore, resetHandler: _resetQuiz),
      ),
    );
  }
}
