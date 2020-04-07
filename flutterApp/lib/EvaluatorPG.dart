import 'package:flutter/material.dart';
import 'package:flutterApp/QuestionForm.dart';
import 'package:flutterApp/editeval.dart';
import 'package:flutterApp/editfounder.dart';
//Checking to see if we need menuWidgets
//import 'menuWidgets.dart';
import 'addeval.dart';
import 'addfounder.dart';
import 'rmveval.dart';
import 'rmvfounder.dart';

//Dont change class name (FirstRoute) without changing it in main.dart.
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        //automaticallyimplyleading takes away back button when using Appbar
        automaticallyImplyLeading: false,
        title: Text(
          'First Route',
          style: TextStyle(fontSize: 32),
        ),
        actions: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }, //needs to be able to log the person out
            child: Text('Log Out'),
            color: Colors.blueGrey,
          )
        ],
      ),
    body: SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Container(
              child: Center(child: Image.asset('assets/startupLogo.png')),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * .10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: Column(
                    children: <Widget>[
                      Text('Evaluator',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center),
                      Container(
                        height: 600,
                        width: 400,
                        color: Colors.blueGrey[100],
                        child: ListView(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                              height: 100,
                              child: AddEvaluator(),
                              ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 100,
                            child: RemoveEvaluator(),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 100,
                            child: EditEvaluator(),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 100,
                            child: RaisedButton(
                              textColor: Colors.white,
                              onPressed: () 
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Question()));
                              },
                              child: Text('Invite',
                                  style: TextStyle(fontSize: 20)),
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          // SizedBox(
                          //   height: 100,
                          //   child: PDFMaker(),
                          // ),
                        ],
                        ),//
                      ),
                    ],
                  ),
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * .90,
                ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    children: <Widget>[
                      Text('Founder',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center),
                      SizedBox(
                          height: 600,
                          width: 400,
                          child: ListView(
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                height: 100,
                                child: AddFounder(),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                height: 100,
                                child: RemoveFounder(),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                height: 100,
                                child: EditFounder(),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          )),
                    ],
                  ),
                  color: Colors.white,
                  //700
                  height: MediaQuery.of(context).size.height * .90,
                )),
              ],
            ),
          ],
        ),
    ),
    );
  }
}
