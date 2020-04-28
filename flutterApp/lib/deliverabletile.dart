//Created on: 3/18/2020
//class DeliverableTile:
//      Container, for the deliverables, that has interactable cards
//      different operations. The operations are as follows: invite and send PDF

import 'package:flutter/material.dart';
import 'choosefounder.dart';

class DeliverableTile extends StatefulWidget {
  @override
  DeliverableTileState createState() {
    return DeliverableTileState();
  }
}

class DeliverableTileState extends State<DeliverableTile> {
  @override
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Deliverable Workshop",
                    style: new TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18,6,18,0),
              child: Card(
                color: Colors.grey[600],
                child: ListTile(
                  dense: true,
                  onTap: startUpWindow,
                  leading: Icon(
                    Icons.mail, color: Colors.blue,
                  ),
                  title: Text(
                    'View Startup Report', style: TextStyle(color: Colors.white,),
                  ),
                  subtitle: Text(
                    'View the report of a choosen startup', style: TextStyle(color: Colors.white,),
                  ),
                  trailing: Icon(
                    Icons.forward, color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startUpWindow() {
    SimpleDialog box = SimpleDialog(
      children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "X",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            "Choose StartUp",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        ),
        ChooseFounder(),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return box;
        });
  }
}