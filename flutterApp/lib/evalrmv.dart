import 'dart:async';

import 'package:flutter/material.dart';
import 'eval.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//Debugging v for the problems (v indicates down)
//import 'package:firebase_database/firebase_database.dart';

//add in a warning bax before the deletion of the evaluator 3/29/20

class EvalRmv extends StatefulWidget {
  @override
  EvalRmvState createState() {
    return EvalRmvState();
  }
}

//clean up the fetching code
class EvalRmvState extends State<EvalRmv> {
  //Testing to see if we need this (Going through the problems... )
  //static FirebaseDatabase _database = FirebaseDatabase.instance;
  Iterable<String> keysFromMap;
  String temp;

  //fetch the evaluator list from the database
  Future<List<Eval>> evaluatorsList(Iterable<String> temp) async {
    const url = 'https://projectworkflow.firebaseio.com/Evaluators.json';
    final response = await http.get(url);
    Map<String, dynamic> fetchedEvaluatorsList = json.decode(response.body);
    dynamic valuesFromMap = fetchedEvaluatorsList.values;
    List<Eval> evaluatorList = new List();
    keysFromMap = fetchedEvaluatorsList.keys;

    for (var v in valuesFromMap) {
      Eval test = Eval(
          firstName: v['firstName'],
          lastName: v['lastName'],
          email: v['email'],
          weight: v['weight'],
          choice: false);
      evaluatorList
          .add(test); //saves to this list, tested the output and recieved data
    }
    return evaluatorList;
  }

  //delete the evaluator from the database
  Future<void> removeEvaluator(String key) async {
    String url =
        'https://projectworkflow.firebaseio.com/Evaluators/' + key + '.json';
    return await http.delete(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .40,
      width: MediaQuery.of(context).size.width * .25,
      color: Colors.grey[350],
      child: FutureBuilder(
        future: evaluatorsList(keysFromMap),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return new Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                        '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}      ${snapshot.data[index].email}'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () async {
                      confirmationPopUp(keysFromMap.elementAt(index), snapshot.data[index].firstName, snapshot.data[index].lastName);
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(
              "Error: ${snapshot.error}",
            );
          }
          return SizedBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
              strokeWidth: 10,
            ),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .05,
          );
        },
      ),
    );
  }

  void confirmationPopUp(String key, String firstName, String lastName) {
    SimpleDialog box = SimpleDialog(
      title: Text(
        'Confirm Deletion',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        Center(child: Text('Are you sure you want to delete $firstName $lastName?')),
        Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 120.0, top: 10),
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
              ),
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: FlatButton(
              onPressed: () async {
                await removeEvaluator(key);
                Navigator.pop(context);
              },
              child: Text(
                'Delete',
              ),
              color: Colors.red,
            ),
          ),
        ])
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return box;
      },
    );
  }
}

