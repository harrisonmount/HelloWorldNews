import 'package:flutter/material.dart';
import 'dart:io';
import 'package:csv/csv.dart';

class OnBoarding extends StatefulWidget {
  //
  OnBoarding({Key key, @required this.text, @required this.text2}) : super(key: key);
  final String text;
  final String text2;

  final String title = 'Select Interests';

  @override
  State<StatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  TextStyle style = TextStyle(fontFamily: 'HelveticaNeue', fontSize: 20.0);

  GlobalKey<ScaffoldState> _key;
  List<String> _dynamicChips;
  List<String> _interests;
  List<String> _interests2;
  List<String> _filters;


  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();

    _interests = ['optionA', 'optionB', 'optionC', 'optionD', 'optionE', 'optionF'];
    _interests2 = ['optionAa', 'optionB', 'optionC', 'optionD', 'optionE', 'optionF'];
    //List<List<dynamic>> csv = csvToList('Interests.csv');

    _filters = <String>[];

  }


  Widget interestsSectionDisplay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 25.0),
        singleSectionColumn(_interests),
        SizedBox(height: 25.0),
        Text('Selected: ${_filters.join(', ')}'),
      ],
    );
  }


  singleSectionColumn(List interestname) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            interestname[0],
            textAlign: TextAlign.left,
            style: style.copyWith(
                fontSize: 27.0,fontWeight: FontWeight.bold),
          ),
          Container(
            child: Wrap(
              spacing: 10.0,
              runSpacing: 2.0,
              children: List<Widget>.generate(interestname.length, (int index) {
                return FilterChip(
                    label: Text(interestname[index]),
                    selectedColor: Colors.blue,
                    showCheckmark: false,
                    selected: _filters.contains(interestname[index]),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _filters.add(interestname[index]);
                        } else {
                          _filters.removeWhere((String name) {
                            return name == interestname[index];
                          });
                        }
                      });
                    }
                );
              }),
            )
          ),
        ],
    );
  }

  List<List> csvToList(File myCsvFile){
    CsvToListConverter c =
        new CsvToListConverter(eol: "\r\n", fieldDelimiter: ",");
    List<List> listCreated = c.convert(myCsvFile.readAsStringSync());
    return listCreated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(//used container to align the interestsSectionDisplay
        alignment: Alignment.center,
        child: interestsSectionDisplay(),
      )
    );
  }
}


/*List<List> csvToList(File myCsvFile){
  csv.CsvToListConverter c =
      new csv.CsvToListCoverter(eol: "\r\n", fileDelmiter: ",");
  List<List listCreated = c.convert(myCsvFile.readAsStringSync());
  return listCreated;
}*/
//READING INTERESTS FROM CSV
/*
int readCSV(String s){
  final lines = File(s).readAsLinesSync();

  for (var line in lines){
    print(line);
  }

  return 1;
}*/

//For First Initials Displayed in circle before text
/*avatar: CircleAvatar(
            child: Text(interest.name[0].toUpperCase()),
          ),*/