import 'package:flutterApp/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterApp/EvaluatorPG.dart';
import 'package:flutterApp/passwordRecover.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutterApp/mahoganyDashboard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:async';

bool alertHasShown = false;

var alertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    side: BorderSide(
      color: Colors.red,
    ),
  ),
  titleStyle: TextStyle(
    color: Colors.red,
  ),
);

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Welcome', style: TextStyle(fontSize: 32)),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  Future<bool> fetchCredentials() async {
    bool flag = false;
    const url = 'https://projectworkflow.firebaseio.com/credentials.json';
    final response = await http.get(url);
    Map<String, dynamic> verify = json.decode(response.body);
    if (verify['Username'] == _email) {
      flag = true;
    } else {
      flag = false;
    }
    if (verify['Password'] == _password) {
      flag = true;
    } else {
      flag = false;
    }
    return flag;
  }

  String name;
  String pass;
  final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
  final _formKey = GlobalKey<FormState>();
  var _email, _password;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
              //child:
              ),
          Center(
            //instead of hardcode 175, container can be infinity length but the widgets within can be centered to be center of the container.
            //or use media query class
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  screenSize.width * 0.40,
                  screenSize.width * 0.10,
                  screenSize.width * 0.40,
                  screenSize.width * 0.10),
              child: Column(children: <Widget>[
//////////////////////////////////////Text Fields
                new MyImageWidget(),

                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.red,
                      size: 24.0,
                    ),
                    hintText: 'Email',
                  ),
                  //Validation Section for Email Textfield
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Error: Email is empty.');
                    }

                    if (!value.contains('@') | !value.contains('.')) {
                      return ('Please type in a valid email address');
                    }
                    _email = value;
                    //Added this to get rid of the problem (PLEASE DELETE IF IT CAUSES AN ISSUE!)
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      onPressed();
                    },

                    obscureText: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.red,
                          size: 24.0,
                        ),
                        hintText: 'Password'),
                    //Validation Section for Password Textfield
                    validator: (value) {
                      if ((value.isEmpty) |
                          (value.length <= 7) |
                          (!value.contains(
                              new RegExp(r'[!@#$%^&*(),.?":{}|<>]')))) {
                        return ('Password is invalid.');
                      }
                      _password = value;
                      //Added this to get rid of the problem (PLEASE DELETE IF IT CAUSES AN ISSUE!)
                      return null;
                    },
                  ),
                ),

////////////////////////////////Submission Button
                RaisedButton(
                  color: Colors.grey[600],
                  onPressed: onPressed,
                  child: Text('LOG IN'),
                ),
                // ForgotPasswordPopup(),
////////////////////////////
                // RaisedButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => Dashboard()));
                //   },
                //   child: Text('Dashboard'),
                // ),
                // RaisedButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => FirstRoute()));
                //   },
                //   child: Text('Original next Page'),
                // ),
/////////////////////////////
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  void onPressed() {
    var form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() async {
        if (await fetchCredentials() == true) {
          Navigator.push(
            context,
            //MaterialPageRoute(builder: (context) => FirstRoute()),
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        } else {
          if (alertHasShown == false) {
            alertHasShown = true;
            Alert(
              context: context,
              style: alertStyle,
              type: AlertType.error,
              title: "HUH?",
              desc: "we can't find you",
              buttons: [
                DialogButton(
                  child: Text(
                    "Okay",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    alertHasShown = false;
                  },
                  width: 120,
                )
              ],
            ).show();
          }

          // Timer(Duration(seconds: 3), () {
          //   Navigator.pop(context);
          // });
        }
      });
    }
  }
}
