//COMMENTED OUT ALL PACKAGES THAT AREN'T BEING USED
//
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import 'package:path_provider/path_provider.dart';
//import 'package:pdf/pdf.dart';
//import 'package:pdf/widgets.dart' as pdfz;
//import 'dart:io';



class StartupNames {
  String startupName;

  StartupNames({this.startupName});

  factory StartupNames.fromJson(dynamic value) {
    return StartupNames(
      startupName: value['firstName'],
    );
  }
}

Future<List<StartupNames>> fetchRandomFormNames() async {
  const url = 'https://projectworkflow.firebaseio.com/Assessments.json';
  final response = await http.get(url);
  Map<String, dynamic> evaluations = json.decode(response.body);

  dynamic onlyValues = evaluations.values; //Map consists of Key and Value

  //print(onlyValues);
  //print("---------json decoded map above-------");

  List<StartupNames> startups =
      manipulateValue(onlyValues); //still have to iterate

  print("-------THESE ARE VALUES---------");
  for (var plzWork in startups) {
    print(plzWork.startupName);
  }
  return startups;
}

List<StartupNames> manipulateValue(dynamic value) {
  List<StartupNames> list = new List();

  for (var v in value) {
    StartupNames startupInfo = new StartupNames.fromJson(v);
    if (startupInfo.startupName != null) {
      list.add(startupInfo);
    }
  }

  print("Read values--------------------");
  for (var instancer in list) {
    print(instancer.startupName);
  }

  return list;
}

// class PDFMaker extends StatefulWidget {
//   @override
//   PDFMakerState createState() {
//     return PDFMakerState();
//   }
// }

// class PDFMakerState extends State<PDFMaker> {

// ///////////////////pdf CREATION BELOW/////////////////////
//   final pdfDoc = pdfz.Document();
//   void viewPDF(){
//     pdfDoc.addPage(
//       pdfz.MultiPage(
//         pageFormat: PdfPageFormat.a4,
//         margin: pdfz.EdgeInsets.all(16),

//         build: (pdfz.Context context){
//           return <pdfz.Widget> [

//             pdfz.Header(level:0,
//             child: pdfz.Text("HELLOOOO IT WORKED",)
//             ),

//             pdfz.Paragraph(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
//             ),

//             pdfz.Paragraph(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
//             ),

//             pdfz.Header(level: 2,
//             child: pdfz.Text("Sub Heading HERE!!")
//             ),

//             pdfz.Paragraph(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
//             ),


//           ];
//         }
         

//     )
//     );

//   }

//   Future savePDF()async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();

//     String documentPath = documentDirectory.path;

//     File file = File("$documentPath/example.pdf");
//     file.writeAsBytesSync(pdfDoc.save());
//   }

//////////////////////////////ABOVE IS pdf CREATION////////////////////


  // Widget loadedStartupNames = FutureBuilder<List<StartupNames>>(
  //   future: fetchRandomFormNames(),
  //   builder: (context, snapshot) {
  //     if (snapshot.hasData) {
  //       return Container(
  //         height: MediaQuery.of(context).size.height * .3,
  //         width: MediaQuery.of(context).size.width * .3,
  //         child: new ListView.builder(
  //           itemCount: snapshot.data.length,
  //           itemBuilder: (context, index) {

  //              return new ListTile(
  //                onTap: () async { Navigator.push(context, MaterialPageRoute(builder: (context) => Questionaire( startup: 'string', ), ), ); },
  //                leading: new Icon(Icons.business,),
  //                title: new Text(snapshot.data[index].startupName,),
  //                trailing: new Icon(Icons.check_box_outline_blank),
                 
  //              );
              
  //           },
  //         ),
  //       );
  //     } else if (snapshot.hasError) {
  //       return new Text("${snapshot.error}");
  //     }

  //     // By default, show a loading spinner
  //     return new CircularProgressIndicator();
  //   },
  // );

  // void pdfPopUp() {
  //   SimpleDialog dialog = SimpleDialog(
  //     title: Text("Choose StartUp"),
  //     children: <Widget>[
        
  //       loadedStartupNames,
  //     ],
  //   );

  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return dialog;
  //       });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Flexible(
  //     child: Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: Card(
  //         color: Colors.grey[600],
  //         child: ListTile(
  //           onTap: pdfPopUp, //add remove functionality here
  //           leading: Icon(
  //             Icons.picture_as_pdf, color: Colors.blue,
  //           ),
  //           title: Text(
  //             'Process PDF', style: TextStyle(color: Colors.white,),
  //           ),
  //           subtitle: Text(
  //             'Process analytics and send out PDF', style: TextStyle(color: Colors.white,),
  //           ),
  //           trailing: Icon(
  //             Icons.publish, color: Colors.blue,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }


 



//}
