import 'package:flutter/material.dart';
import 'founder.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FounderRemove extends StatefulWidget {
  @override
  FounderRemoveState createState() {
    return FounderRemoveState();
  }
}

class FounderRemoveState extends State<FounderRemove> {
  Iterable<String> keys; //
  //fetches the data from the database
  Future<List<Founder>> fetchedFounder() async {
    const url = 'https://projectworkflow.firebaseio.com/Founder.json';
    final response = await http.get(url);
    Map<String, dynamic> fetchedEvaluatorsList = json.decode(response.body);
    dynamic valuesFromMap = fetchedEvaluatorsList.values;
    List<Founder> founderList = new List();
    keys = fetchedEvaluatorsList.keys;

    for (var v in valuesFromMap) {
      Founder found = Founder(foundry: v['foundry']);
      founderList.add(found);
    }
    return founderList;
  }

  //add in remove function here
  Future<void> removeFounder(String key) async {
    String url =
        'https://projectworkflow.firebaseio.com/Founder/' + key + '.json';
    return await http.delete(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .40,
      width: MediaQuery.of(context).size.width * .25,
      color: Colors.grey[350],
      child: FutureBuilder(
        future: fetchedFounder(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scrollbar(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return new Card(
                    child: ListTile(
                      leading: Icon(Icons.business, color: Colors.red,),
                      title: Text('${snapshot.data[index].foundry}',),
                      trailing: Icon(Icons.arrow_right, color: Colors.red,),
                      onTap: () {
                        confirmationPopUp(
                            keys.elementAt(index), snapshot.data[index].foundry);
                      },
                    ),
                  );
                },
              ),
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

  void confirmationPopUp(String key, String companyName) {
    SimpleDialog box = SimpleDialog(
      title: Text(
        'Confirm Deletion',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        Center(child: Text('Are you sure you want to delete $companyName?')),
        Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 130.0, top: 10),
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
                await removeFounder(key);
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
