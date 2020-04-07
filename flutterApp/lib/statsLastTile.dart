import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';

class Statistics {
  int numberOfCompanies = 0;

  Statistics({this.numberOfCompanies});

  factory Statistics.fromJson(Map<String, dynamic> mapForCompanyCount) {
    return Statistics(
      numberOfCompanies: mapForCompanyCount.length,
    );
  }
}

Future<int> fetchStats() async {
  const companiesURL = 'https://projectworkflow.firebaseio.com/Founder.json';

  final companyJsonResponse = await http.get(companiesURL);

  Map<String, dynamic> mapOfFetchedCompanies =
      json.decode(companyJsonResponse.body);

  Statistics statsHolder = new Statistics.fromJson(mapOfFetchedCompanies);

  return (statsHolder.numberOfCompanies);
}

class StatsLastTile extends StatefulWidget {
  @override
  StatsLastTileState createState() {
    return StatsLastTileState();
  }
}

class StatsLastTileState extends State<StatsLastTile> {
  Widget fetchStatz = FutureBuilder<int>(
    future: fetchStats(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Container(
          child: Expanded(
                      child: AutoSizeText(
                  "${snapshot.data}",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 125,
                      fontWeight: FontWeight.bold),
                  minFontSize: 20,
                  maxLines: 1,
                 // textAlign: TextAlign.center,
                ),
                      
          ),
        );
      } else if (snapshot.hasError) {
        return new Text("${snapshot.error}");
      }

      // By default, show a loading spinner
      return new CircularProgressIndicator();
    },
  );

//////////////////////////////////////////////

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  "Number of Companies",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  minFontSize: 8,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Flexible(
            child: Divider(
              indent: 0,
              endIndent: 0,
              color: Colors.blue,
              thickness: 1.0,
            ),
          ),
          
          fetchStatz,
        ],
      ),
    );
  }
}
