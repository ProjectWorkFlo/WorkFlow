import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math' show Random;

class User {
  String name;

  User({this.name});
}

//Future fetchNameFromApi function is not my code.
//I used a similar approach given by https://medium.com/@rajajawahar77/create-your-first-api-call-in-flutter-a04d023ebd50
Future<List<User>> fetchNamesFromAPI() async {
  final response = await http.get(
      'https://uinames.com/api/?region=United%20States&amount=25'); //My choice of API to use
  List responseJson = json.decode(response.body.toString());
  List<User> nameList = createNameList(responseJson);
  //print(responseJson);
  return nameList;
}

//I used a similar approach given by https://medium.com/@rajajawahar77/create-your-first-api-call-in-flutter-a04d023ebd50
List<User> createNameList(List data) {
  List<User> list = new List();

  for (int i = 0; i < data.length; i++) {
    String firstName = data[i]["name"];
    User singleName = new User(name: firstName);
    list.add(singleName);
  }
  return insertDeveloperNames(list);
  //return list;
}

List<User> insertDeveloperNames(List listOfAllNames) {
  var randomNum = new Random();

  User myName = new User(name: "Gabriel");
  User myName1 = new User(name: "Jesus");
  User myName2 = new User(name: "Joshua");
  User myName3 = new User(name: "Nick");

  listOfAllNames.insert(randomNum.nextInt(24), myName);
  listOfAllNames.insert(randomNum.nextInt(24), myName1);
  listOfAllNames.insert(randomNum.nextInt(24), myName2);
  listOfAllNames.insert(randomNum.nextInt(24), myName3);

  return listOfAllNames;
}

/////////////////////////////////////

////////////////////////////////////MOVE THIS TO ITS OWN FILE////////////////////////
class ForgotPasswordPopup extends StatefulWidget {
  @override
  ForgotPasswordState createState() {
    return ForgotPasswordState();
  }
}

class ForgotPasswordState extends State<ForgotPasswordPopup> {
//here is the function that will be ran when you click object made in build container below
  void passwordSolution() {
    //widget() here;

    Widget mainQuestion = SimpleDialogOption(
        child: Text(
            "Can you choose the name(s) of the developer(s) that designed this application?"));

//I used a similar approach given by https://medium.com/@rajajawahar77/create-your-first-api-call-in-flutter-a04d023ebd50
    Widget loadedNames = FutureBuilder<List<User>>(
      future: fetchNamesFromAPI(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(snapshot.data[index].name,
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    new Divider()
                  ]);
            },
            shrinkWrap: true,
          );
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }

        // By default, show a loading spinner
        return new CircularProgressIndicator();
      },
    );
/*
//NOT BEING USED, TEMPORARILY COMMENTED OUT
    Widget listOptions = SimpleDialogOption(
        child: Container(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
 
        // Row(
        //   children: <Widget>[
        //     Radio(
        //       value: 1,
        //       groupValue: developersSelect,
        //       activeColor: Colors.green,
        //       onChanged: (val) {},
        //     ),
        //   ],
        // ),
        // Radio(
        //   value: 2,
        //   groupValue: developersSelect,
        //   activeColor: Colors.blue,
        //   onChanged: (val) {},
        // ),
      ],
    )));
*/
    SimpleDialog passwordDialog = SimpleDialog(
      title: Text(
          "Before you can reset your password, you must answer a question.",
          style: new TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      children: <Widget>[
        mainQuestion,

        SizedBox(
          width: 300,
          child: loadedNames,
        ),

        //  listOptions,
        // loadedNames,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return passwordDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //Here is where you create the object where the state will change on some action,
        // above will be function that your object calls.

        child: FlatButton(
      onPressed: passwordSolution,
      child: Text(
        "Forgot password?",
        textAlign: TextAlign.center,
      ),
    ));
  }
}
////////////////////////////////////////////////////////////////////////////////
