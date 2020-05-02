import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './questionaire.dart';

class NameDropdown extends StatefulWidget {
  @override
  _NameDropdownState createState() => _NameDropdownState();
}

class _NameDropdownState extends State<NameDropdown> {
  
  List listOfNames = [];

  Future<List<String>> pullValues() async {
    List<String> listNames = [];
    const url2 = 'https://projectworkflow.firebaseio.com/Evaluators.json';
    final response2 = await http.get(url2);
    Map<String, dynamic> fetchedEvaluatorsList2 = json.decode(response2.body);
    dynamic valuesFromMap2 = fetchedEvaluatorsList2.values.toList();
    valuesFromMap2.forEach((k) {
      listNames.add('${k['firstName']} ${k['lastName']}');
    });    
    return listNames;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pullValues(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  hint: Text("Who are you?"),
                  value: nameDropDown,
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
                      nameDropDown = newValue;
                      print("DropDown Value is now..: $nameDropDown");
                    });
                  },
                  items:
                      snapshot.data.map<DropdownMenuItem<String>>((
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
        } else if (snapshot.hasError) {
          print("Error : ${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
