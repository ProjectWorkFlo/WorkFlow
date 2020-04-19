import 'package:flutter/material.dart';

class NameDropdown extends StatefulWidget {
  @override
  _NameDropdownState createState() => _NameDropdownState();
}

class _NameDropdownState extends State<NameDropdown> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            hint: Text("Who are you?"),
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            underline: Container(
              height: 2,
              color: Colors.blueGrey,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>[
              'Gabe',
              'Nick',
              'Jesus',
              'Cash',
            ].map<DropdownMenuItem<String>>((
              String value,
            ) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
