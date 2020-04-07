import 'package:flutter/material.dart';

class TextClass extends StatelessWidget {
  final String outputText;

  TextClass(this.outputText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            outputText,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

