import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result({required this.resultScore, required this.resetHandler});

  String get resultPhrase {
    var resultText = 'Questions Over!\n';
    if (resultScore <= 8) {
      resultText += 'Innocent Soul 😇.';
    } else if (resultScore <= 12) {
      resultText += 'Midway Innocent 🙂.';
    } else if (resultScore <= 16) {
      resultText += 'Not Innocent 😏.';
    } else {
      resultText = 'Ah! Yes the negotiator 😈.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text("Reset"))
        ],
      ),
    );
  }
}
