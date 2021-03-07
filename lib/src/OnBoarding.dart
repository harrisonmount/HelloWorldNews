import 'package:flutter/material.dart';
import 'dart:io';
import 'package:csv/csv.dart' as csv;

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
  //
  TextStyle style = TextStyle(fontFamily: 'HelveticaNeue', fontSize: 20.0);
  //var x = readCSV('Interests.csv');
  GlobalKey<ScaffoldState> _key;
  List<String> _dynamicChips;
  bool _isSelected;
  List<Interest> _interests;
  List<Interest> _interests2;
  List<String> _filters;
  List<String> _filters2;
  List<String> _choices;
  int _defaultChoiceIndex;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();
    _isSelected = false;
    _defaultChoiceIndex = 0;
    _filters = <String>[];
    _interests = <Interest>[
      const Interest('Republican'),
      const Interest('Democrat'),
      const Interest('Green Party'),
      const Interest('Joe Biden'),
      const Interest('Donald Trump'),
      const Interest('Andrew Yang'),

    ];

    _interests2 = <Interest>[
      const Interest('Space'),
      const Interest('Chemistry'),
      const Interest('Robotics'),
      const Interest('Computer Science'),
      const Interest('AI'),
      const Interest('Biology'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 45.0),
          Text(
            'Politics',
            textAlign: TextAlign.left,
            style: style.copyWith(
                fontSize: 27.0,fontWeight: FontWeight.bold),
          ),
          Wrap(
            children: interestWidgets.toList(),
          ),
          Text(
            'Interests2',
            textAlign: TextAlign.left,
            style: style.copyWith(
                fontSize: 27.0,fontWeight: FontWeight.bold),
          ),
          Wrap(
            children: interestWidgets.toList(),
          ),
          Text('Selected: ${_filters.join(', ')}'),
        ],
      ),
    );
  }




  Iterable<Widget> get interestWidgets sync* {
    for (Interest interest in _interests) { //Loop of widgets in the list _insterests
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: FilterChip(
          avatar: CircleAvatar(
            child: Text(interest.name[0].toUpperCase()),
          ),
          label: Text(interest.name),
          selected: _filters.contains(interest.name),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filters.add(interest.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == interest.name;
                });
              }
            });
          },
        ),
      );
    }
  }
}

class Interest {
  const Interest(this.name);
  final String name;
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
