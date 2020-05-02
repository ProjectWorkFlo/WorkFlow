import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './questionaire.dart';

class CompanyDropdown extends StatefulWidget {
  @override
  _CompanyDropdownState createState() => _CompanyDropdownState();
}

class _CompanyDropdownState extends State<CompanyDropdown> {
  List listOfCompanies = [];

  Future<List<String>> pullValues() async {
    List<String> listCompanies = [];
    const url2 = 'https://projectworkflow.firebaseio.com/Founder.json';
    final response2 = await http.get(url2);
    Map<String, dynamic> fetchedCompaniesList = json.decode(response2.body);
    dynamic valuesFromMap2 = fetchedCompaniesList.values.toList();
    valuesFromMap2.forEach((k) {
      listCompanies.add('${k['foundry']}');
    });
    return listCompanies;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pullValues(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  hint: Text("Which company are your evaluating?"),
                  value: companyDropDown,
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
                    setState(() {
                      companyDropDown = newValue;
                    });
                  },
                  items: snapshot.data.map<DropdownMenuItem<String>>((
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
