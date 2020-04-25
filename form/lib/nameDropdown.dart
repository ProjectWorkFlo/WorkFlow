import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NameDropdown extends StatefulWidget {
  @override
  _NameDropdownState createState() => _NameDropdownState();
}

List listOfNames = [];

/*
Future<List> pullValues() async {
  List listNames = [];
  const url2 = 'https://projectworkflow.firebaseio.com/Evaluators.json';
  final response2 = await http.get(url2);
  Map<String, dynamic> fetchedEvaluatorsList2 = json.decode(response2.body);
  dynamic valuesFromMap2 = fetchedEvaluatorsList2.values.toList();
  valuesFromMap2.forEach((k) {
    listNames.add('${k['firstName']} ${k['lastName']}');
  });
  print("printing from the function:");
  print(listNames);
  //return listNames;
  setState(() {
    listOfNames = listNames;
  });
}
*/



class _NameDropdownState extends State<NameDropdown> {


pullValues() async {
  List listNames = [];
  const url2 = 'https://projectworkflow.firebaseio.com/Evaluators.json';
  final response2 = await http.get(url2);
  Map<String, dynamic> fetchedEvaluatorsList2 = json.decode(response2.body);
  dynamic valuesFromMap2 = fetchedEvaluatorsList2.values.toList();
  valuesFromMap2.forEach((k) {
    listNames.add('${k['firstName']} ${k['lastName']}');
  });
  print("Made it inside pullValues");
  print(listNames);
  //return listNames;
  setState(() {
    listOfNames = listNames;
  });
}

  String dropdownValue;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            hint: Text("Who are you?"),
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String newValue) {
              pullValues();
              setState(() {
                dropdownValue = newValue;
                print("This is the pullValues return");
                print(listOfNames);
              });
            },
            items: <String>[
              //listOfNames[0],
              'Gabe',
              'Nick',
              'Jesus',
              'Cash',
            ].map<DropdownMenuItem<String>>((
              String value,
            ) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
