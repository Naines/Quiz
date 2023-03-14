import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int quesIndex;
  final Function? answerQuestion;

  Quiz({required this.answerQuestion, required this.questions, required this.quesIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Question(
          questions[quesIndex]['questionText'] as String,
        ),
        ...(questions[quesIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion!(answer['score']),
              answer['text'] as String);
        }).toList()

        //Spread operator -> ... => take a list and pull all values
        //in that list out and add them to surreounding list as individual values
      ],
    );
  }
}
