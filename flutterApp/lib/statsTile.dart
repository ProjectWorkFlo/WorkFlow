import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Statistics {
  int avgFormScores = 0;

  Statistics({this.avgFormScores});

  factory Statistics.setScroes(dynamic mapForFormCount, int index) {
    return Statistics(
      avgFormScores: mapForFormCount['storedValues'][index],
    );
  }
}

Future<double> fetchStats() async {
  const formURL = 'https://projectworkflow.firebaseio.com/Assessments.json';

  final formJsonResponse = await http.get(formURL);

  Map<String, dynamic> mapOfFetchedForms = json.decode(formJsonResponse.body);

  int overallScoreIndex = 11;
  int tempInt = 0;

  dynamic valuesOfMapOfFetchedForms = mapOfFetchedForms.values;

  print(valuesOfMapOfFetchedForms);

  for (var temp in valuesOfMapOfFetchedForms) {
    Statistics overallScoreHolder =
        new Statistics.setScroes(temp, overallScoreIndex);
    if (overallScoreHolder.avgFormScores != null) {
      tempInt = tempInt + overallScoreHolder.avgFormScores;
    }
  }

  return (tempInt / mapOfFetchedForms.length);
}

class StatsTile extends StatefulWidget {
  @override
  StatsTileState createState() {
    return StatsTileState();
  }
}

class StatsTileState extends State<StatsTile> {
  // @override

  Widget fetchStatz = FutureBuilder<double>(
    future: fetchStats(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Container(

          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: <Widget>[
                CircularPercentIndicator(
                  header: AutoSizeText(
                    'Overall Rating Given',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  radius: MediaQuery.of(context).size.height * .25,
                  animation: true,
                  animationDuration: 2000,
                  lineWidth: MediaQuery.of(context).size.height * .015,
                  percent: snapshot.data / 5,
                  reverse: false,
                  arcBackgroundColor: Colors.red,
                  arcType: ArcType.FULL,
                  center: AutoSizeText(
                    "${(snapshot.data).toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    maxFontSize: 26,
                    maxLines: 1,
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.transparent,
                  progressColor: Colors.blue,
                ),
                Container(
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 3,),
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 3,),
                        Expanded(
                          child: AutoSizeText(
                  "This number represents the forms' overall score",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      ),
                  minFontSize: 8,
                  maxLines: 2,
                 //textAlign: TextAlign.center,
                ),
                        ),
                        
                      ],
                    ),
                  
                ),
                
              ],
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
    return fetchStatz;
  }

}
