import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  // final Function selectHandler;
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        // color: Colors.black
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          // foregroundColor: Colors.amber,
          textStyle: TextStyle(
            color: Colors.black ,
          )
        ),
        child: Text(answerText),
      ),
    );
  }
}
