import 'package:flutter/material.dart';

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
          style: TextStyle(fontSize: 35),
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
      body: Column(
        children: <Widget>[
          Container(
            child: Center(child: Image.asset('assets/startupLogo.png')),
            color: Colors.white,
            height: 200,
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
                              child: RaisedButton(
                                textColor: Colors.white,
                                onPressed: () {},
                                child:
                                    Text('Add', style: TextStyle(fontSize: 20)),
                                color: Colors.blue[900],
                              )),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 100,
                            child: RaisedButton(
                              textColor: Colors.white,
                              onPressed: () {},
                              child: Text('Remove',
                                  style: TextStyle(fontSize: 20)),
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 100,
                            child: RaisedButton(
                              textColor: Colors.white,
                              onPressed: () {},
                              child:
                                  Text('Edit', style: TextStyle(fontSize: 20)),
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 100,
                            child: RaisedButton(
                              textColor: Colors.white,
                              onPressed: () {},
                              child: Text('Invite',
                                  style: TextStyle(fontSize: 20)),
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                color: Colors.white,
                height: 700,
              )),
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
                              child: RaisedButton(
                                textColor: Colors.white,
                                onPressed: () {},
                                child:
                                    Text('Add', style: TextStyle(fontSize: 20)),
                                color: Colors.blue[900],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              height: 100,
                              child: RaisedButton(
                                textColor: Colors.white,
                                onPressed: () {},
                                child: Text('Remove',
                                    style: TextStyle(fontSize: 20)),
                                color: Colors.blue[900],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              height: 100,
                              child: RaisedButton(
                                textColor: Colors.white,
                                onPressed: () {},
                                child: Text('Edit',
                                    style: TextStyle(fontSize: 20)),
                                color: Colors.blue[900],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        )),
                  ],
                ),
                color: Colors.white,
                height: 700,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
