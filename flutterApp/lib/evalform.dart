import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//custom form class for the evaluator
//used with addeval.dart to create a pop
//with two entry fields
//email and weight

//updated regular expression in validator of add
//now only gets up to two decimal places
//still need to find away to limit the front number to just 1 or 0
//updated: 4/18/2020

class EvalCustomForm extends StatefulWidget {
  @override
  EvalCustomFormState createState() {
    return EvalCustomFormState();
  }
}

class EvalCustomFormState extends State<EvalCustomForm> {
  Duration tck = new Duration(seconds: 1);
  final _evalFormKey = GlobalKey<FormState>();
  var _evalFirstName, _evalLastName, _evalEmail, _evalWeight;

  @override
  Widget build(BuildContext context) {
    Future<void> addEvaluator() {
      const url = 'https://projectworkflow.firebaseio.com/Evaluators.json';
      return http.post(
        url,
        body: json.encode(
          {
            'firstName': _evalFirstName,
            'lastName': _evalLastName,
            'email': _evalEmail,
            'weight': _evalWeight
          },
        ),
      );
    }

    return Form(
      key: _evalFormKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextFormField(
              autocorrect: false,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.person_add,
                  color: Colors.green,
                ),
                hintText: 'First Name',
              ),
              //need to add an if statement to check if the email is already in the
              //database
              validator: (value) {
                if (value.isEmpty) {
                  return 'Error Code 0001: empty first name field';
                }
                _evalFirstName = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextFormField(
              autocorrect: false,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.green,
                  ),
                  hintText: 'Last Name'),
              //need to add an if statement to check if the email is already in the
              //database
              validator: (value) {
                if (value.isEmpty) {
                  return 'Error Code 0001: empty last name field';
                }
                _evalLastName = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextFormField(
              autocorrect: false,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  hintText: 'Email'),
              //need to add an if statement to check if the email is already in the
              //database
              validator: (value) {
                if (value.isEmpty) {
                  return 'Error Code 0001: empty email field';
                }

                if (!value.contains('@') || !value.contains('.')) {
                  return 'email must be in the form example@mail.com/net/org/edu';
                }
                _evalEmail = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.score,
                    color: Colors.green,
                  ),
                  hintText: 'Weight (must be a number)'),
              //need to check if input is a number
              validator: (value) {
                if (value.isEmpty) {
                  return 'Error Code 0003: empty weight field';
                }
                if (!value.contains(new RegExp(r'^[+]?[0-9]*\.?[0-9]{0,2}$'))) {
                  return 'weight must be a number';
                }
                _evalWeight = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                if (_evalFormKey.currentState.validate()) {
                  _evalFormKey.currentState.save();
                  addEvaluator();
                  successPopUp();
                  Timer(
                    tck,
                    () {
                      Navigator.pop(context);
                    },
                  );
                }
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//Displays a dialog popup when the
//user enters a valid evaluator
  void successPopUp() {
    Duration tick = new Duration(seconds: 1);

    SimpleDialog box = SimpleDialog(
      title: Text(
        "Evaluator Added",
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 80,
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return box;
        });

    Timer(
      tick,
      () {
        Navigator.pop(context);
      },
    );
  }
}
