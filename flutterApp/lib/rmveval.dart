import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoveEvaluator extends StatefulWidget
{
  @override 
  RemoveEvaluatorState createState()
  {
    return RemoveEvaluatorState();
  }
}

class RemoveEvaluatorState extends State<RemoveEvaluator>
{
  void fetchEvaluators() async {
    const url = 'https://projectworkflow.firebaseio.com/Evaluators.json';
    final response = await http.get(url);
    Map<String, dynamic> verify = json.decode(response.body);
    print(verify);
  }

  Widget build(BuildContext context)
  {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue[900],
      onPressed: rmvEvalPopUp,
      child: Text('Remove',
      style: TextStyle(
        fontSize: 20,
        ),
        ),
      );
  }

  void rmvEvalPopUp()
  {
    fetchEvaluators();
    SimpleDialog box = SimpleDialog(
      title: Text("Remove Evaluator", textAlign: TextAlign.center,
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context)
      {

        return box;
      }
      );    
  }
}