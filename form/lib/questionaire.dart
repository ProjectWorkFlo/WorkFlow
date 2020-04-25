import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './textWidget.dart';
import './nameDropdown.dart';
import './companyDropdown.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './questionaireResponse.dart';
import 'package:flutterApp/widgets.dart';
import 'package:flutterApp/webpageReport.dart';
import 'package:intl/intl.dart';

class Questionaire extends StatefulWidget {
  Questionaire({Key key, startup}) : super(key: key);
  @override
  _QuestionaireState createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyHomePage(),
    );
  }
}

Map map = {
  'pitchName': 'Pitch Name',
  'firstName': 'First Name',
  'lastName': 'Last Name',
  'email': 'Email',
  'productKnowledge': '(Optional) Product Knowledge: Empty',
  'productFeasability': '(Optional) Product Feasability: Empty',
  'marketKnowledge': '(Optional) Market Knowledge: Empty',
  'marketEducationAbility': '(Optional) Market Education: Empty',
  'customerPersonaKnowledge': '(Optional) Customer Persona Knowledge: Empty',
  'customerBuyExecution': '(Optional) Customer Buy Execution: Empty',
  'competitionKnowledge': '(Optional) Competition Knowledge: Empty',
  'competitionExecution': '(Optional) Competition Execution: Empty',
  'founderExperienceInMarket': '(Optional) Founder Experience In Market: Empty',
  'founderBusinessExperience': '(Optional) Founder Business Experience: Empty',
  'founderCoachableFounder': '(Optional) Founder Coachable Founder: Empty',
  'overall': '(Optional) Overall: Empty',
  'feedbackForFounder': '(Optional) Feedback For Founder: Empty',
  'internalFeedback': '(Optional) Internal Feedback: Empty',
  'storedValues': new List(12),
  'dayOfWeek': 'Day of the week',
  'month' : 'month',
};

final List<int> recordedValues = new List(12);
bool nullFlag = false;

void setValue(int index, int newValue) {
  map['storedValues'][index] = newValue;
}

void setOutput(String destination, String host) {
  map[destination] = host;
}

class MyHomePage extends StatelessWidget {
  final feedbackForFounderController = TextEditingController();
  final internalFeedbackController = TextEditingController();
  final inputText = "Please rate from 1-5";
  final pitchName = 'pitchNameHere';
  final DateTime date = DateTime.now();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    feedbackForFounderController.dispose();
    internalFeedbackController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    map['pitchName'] = "Software StartUp";

    Future<void> addAssessment() {
      const url = 'https://projectworkflow.firebaseio.com/Assessments.json';
      return http.post(
        url,
        body: json.encode(
          {
            'pitchName': map['pitchName'],
            'firstName': map['firstName'],
            'lastName': map['lastName'],
            'email': map['email'],
            'productKnowledge': map['productKnowledge'],
            'productFeasability': map['productFeasability'],
            'marketKnowledge': map['marketKnowledge'],
            'marketEducationAbility': map['marketEducationAbility'],
            'customerPersonaKnowledge': map['customerPersonaKnowledge'],
            'customerBuyExecution': map['customerBuyExecution'],
            'competitionKnowledge': map['competitionKnowledge'],
            'competitionExecution': map['competitionExecution'],
            'founderExperienceInMarket': map['founderExperienceInMarket'],
            'founderBusinessExperience': map['founderBusinessExperience'],
            'founderCoachableFounder': map['founderCoachableFounder'],
            'overall': map['overall'],
            'feedbackForFounder': map['feedbackForFounder'],
            'internalFeedback': map['internalFeedback'],
            'storedValues': map['storedValues'],
            'dayOfWeek': map['dayOfWeek'],
            'month' : map['month'],
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[350], //changed 4/4/2020
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900], //changed 4/4/2020
        title: Text(
          map['pitchName'], // changed here on 4/2/2020
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            screenSize.width * 0.10,
            10,
            screenSize.width * 0.10,
            10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: MyImageWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NameDropdown(),
                  CompanyDropdown(),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Product',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TextClass(
                'Knowledge',
              ),
              Response(0, 'productKnowledge'),
              TextClass(
                'Feasability',
              ),
              Response(1, 'productFeasability'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Market',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TextClass(
                'Knowledge',
              ),
              Response(2, 'marketKnowledge'),
              TextClass(
                'Education Ability',
              ),
              Response(3, 'marketEducationAbility'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Customer Questions',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TextClass(
                'Knowledge',
              ),
              Response(4, 'customerPersonaKnowledge'),
              TextClass(
                'Execution',
              ),
              Response(5, 'customerBuyExecution'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Competition',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TextClass(
                'Knowledge',
              ),
              Response(6, 'competitionKnowledge'),
              TextClass(
                'Execution',
              ),
              Response(7, 'competitionExecution'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Team',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TextClass(
                'Knowledge',
              ),
              Response(8, 'founderExperienceInMarket'),
              TextClass(
                'Execution',
              ),
              Response(9, 'founderBusinessExperience'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Founder',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TextClass(
                'Founder Coachability',
              ),
              Response(10, 'founderCoachableFounder'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Overall',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              TextClass(
                'Overall',
              ),
              Response(11, 'overall'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.blue,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextClass(
                  'External',
                ),
              ),
              TextField(
                controller: feedbackForFounderController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please leave feedback for the founder [external]",
                ),
                maxLines: null,
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextClass(
                  'Internal',
                ),
              ),
              TextField(
                controller: internalFeedbackController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please leave feedback for the founder [internal]",
                ),
                maxLines: null,
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebpageReport(),
                      ),
                    );
                  },
                  child: Text('Generate Report'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                    for (var i in map['storedValues']) {
                      if (i == null) {
                        nullFlag = true;
                      }
                    }
                    if (nullFlag == true) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            nullFlag = false;
                            return AlertDialog(
                              content: Text(
                                  "Error! Please complete all 1-5 ratings!"),
                            );
                          });
                    } else if (nullFlag != true) {
                      map['feedbackForFounder'] =
                          feedbackForFounderController.text;
                      map['internalFeedback'] = internalFeedbackController.text;
                      map['dayOfWeek'] = DateFormat('EEEE').format(date);
                      map['month'] = DateFormat('MMMM').format(date);

                      // Nick Function here
                      addAssessment();
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text the that user has entered by using the controller
                            content: Text(
                                "Successfully recorded values!" + map['pitchName'] +
                                '\n' +
                                map['dayOfWeek'] + 
                                '\n' +
                                map['month'] +
                                '\n' +
                                map['productKnowledge'] +
                                '\n' +
                                map['productFeasability'] +
                                '\n' +
                                map['marketKnowledge'] +
                                '\n' +
                                map['marketEducationAbility'] +
                                '\n' +
                                map['customerPersonaKnowledge'] +
                                '\n' +
                                map['customerBuyExecution'] +
                                '\n' +
                                map['competitionKnowledge'] +
                                '\n' +
                                map['competitionExecution'] +
                                '\n' +
                                map['founderExperienceInMarket'] +
                                '\n' +
                                map['founderBusinessExperience'] +
                                '\n' +
                                map['founderCoachableFounder'] +
                                '\n' +
                                map['overall'] +
                                '\n' +
                                map['feedbackForFounder'] +
                                '\n' +
                                map['internalFeedback']
                                ), // +
                          );
                        },
                      );
                    }
                    return null;
                  },
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
