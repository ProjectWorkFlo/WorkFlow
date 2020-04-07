import 'package:flutter/material.dart';
import 'package:flutterApp/widgets.dart';
import 'package:intl/intl.dart';

class WebpageReport extends StatelessWidget {
  final DateTime date = DateTime.now();
  final pitchName = "pitchNameHere";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
              "Pitch Evaluations Summary for today, ${ DateFormat('EEEE').format(date)}",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Container(
              child: Table(
                children: [
                  TableRow(children: [
                    Text("Overall"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Product Knowledge"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Product Feasibility"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Market Knowledge"),
                    Text("Test"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Market Execution Ability"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Customer Persona Knowledge"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Customer Buy/Execution"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Competition Knowledge"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Competition Execution"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Founder Exp in Market"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Founder Biz Exp"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                  TableRow(children: [
                    Text("Coachable Founder"),
                    Text("Test2"),
                    Text("Test2"),
                  ]),
                ],
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                defaultColumnWidth: IntrinsicColumnWidth(),

                //border: TableBorder.all(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
