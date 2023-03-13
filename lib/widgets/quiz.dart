import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int quesIndex;
  final VoidCallback answerQuestion;

  Quiz(
      {required this.answerQuestion,
      required this.questions,
      required this.quesIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Question(questions[quesIndex]['questionText'].toString()),
        ...(questions[quesIndex]['answers'] as List).map((answer) {
          return Answer(answerQuestion, answer);
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
    );
  }
}
