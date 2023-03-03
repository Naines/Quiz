import 'package:flutter/material.dart';
import 'package:quiz/widgets/answer.dart';
import './widgets/question.dart';

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

  void _answerQuestion() {
    setState(() {
      _quesIndex = ++_quesIndex;
    });
    print(_quesIndex);
    // print(questions[_quesIndex]);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What is your favorite color?',
        'answers': ['Black', 'White', 'Red', 'Green'],
      },
      {
        'questionText': 'What is your favorite animal and why is it dog?',
        'answers': ['Dog', 'Cat', 'Rat', 'Lion'],
      },
    ];
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
            Question(questions[_quesIndex]['questionText'].toString()),
            ...(questions[_quesIndex]['answers'] as List).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()

            //Spread operator -> ... => take a list and pull all values
            //in that list out and add them to surreounding list as individual values

            /**Old Code: 
             ElevatedButton(
               onPressed: _answerQuestion,
               child: Text('answer 1'),
             ),
            */
            //this is called state uplifting
            // Answer(_answerQuestion),
            // Answer(_answerQuestion),
            // Answer(_answerQuestion),
          ],
        ),
      ),
    );
  }
}
