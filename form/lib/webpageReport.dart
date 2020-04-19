import 'package:flutter/material.dart';
import 'package:flutterApp/widgets.dart';


class WebpageReport extends StatelessWidget {
  final DateTime date = DateTime.now();
  final pitchName = "Software StartUp";
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          "$pitchName",
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Center(
              child: MyImageWidget(),
            ),
            Text(
              "Pitch Evaluations Summary for (companyName)\n",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                columnWidths: {
                  0: FractionColumnWidth(0.6),
                  1: FractionColumnWidth(0.2),
                  2: FractionColumnWidth(0.2),
                },

                children: [
                  TableRow(children: [
                    Text(
                      "Metric",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      "Score",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      "Range",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Text("Overall"),
                    Text("3"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Product Knowledge"),
                    Text("4"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Product Feasibility"),
                    Text("3"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Market Knowledge"),
                    Text("3.4"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Market Execution Ability"),
                    Text("4"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Customer Persona Knowledge"),
                    Text("3"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Customer Buy/Execution"),
                    Text("4"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Competition Knowledge"),
                    Text("3"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Competition Execution"),
                    Text("2"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Founder Exp in Market"),
                    Text("2"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Founder Biz Exp"),
                    Text("4"),
                    Text("0-4"),
                  ]),
                  TableRow(children: [
                    Text("Coachable Founder"),
                    Text("1"),
                    Text("0-4"),
                  ]),
                ],
                //border: TableBorder.all(),
              ),
            ),
            Text(
              "\n\nFeedback",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 20,
              ),
            ),
            Text("\n\nThis is where external feedback will be placed\n\n"),
            Text("This is where internal feedback will be placed"),
          ],
        ),
      ),
      
    );
  }
}
