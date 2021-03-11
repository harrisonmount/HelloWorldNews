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

    _interests = ['Politics','Andrew Yang','Donald Trump','Republican','Democrat','Green Party','Washington DC'];
    _interests2 = ['Science', 'Ai/Machine Learning', 'Space', 'Blockchain', 'Computer Science', 'Chemistry'];
    //List<List<dynamic>> csv = csvToList('Interests.csv');
    _filters = <String>[];

  }


  Widget interestsSectionDisplayold() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 25.0),
        singleSectionColumn(_interests),
        SizedBox(height: 25.0),
        singleSectionColumn(_interests2),
        Text('Selected: ${_filters.join(', ')}'),
      ],
    );
  }

  ListView interestsSectionDisplay() {
    List interestfile = csvToList('Users/harrisonmount/Desktop/HelloWorld/hello_world/assets/Interests.csv');

    print(interestfile[0]);
    return ListView(
      children: <Widget>[
        for(int x = 0; x < interestfile.length; x++)
        singleSectionColumn(interestfile[x]),
        Text('Selected: ${_filters.join(', ')}'),
      ],
    );
  }

  singleSectionColumn(List interestname) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 25.0),
        Text(
          interestname[0],
          textAlign: TextAlign.left,
          style: style.copyWith(
              fontSize: 27.0,fontWeight: FontWeight.bold),
        ),
        Container(
            child: Wrap(
              spacing: 6.0,
              runSpacing: 2.0,
              children: [for (int x  = 1;  x < interestname.length; x++)
                FilterChip(
                    label: Text(interestname[x]),
                    selectedColor: Colors.blue,
                    showCheckmark: false,
                    selected: _filters.contains(interestname[x]),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _filters.add(interestname[x]);
                        } else {
                          _filters.removeWhere((String name) {
                            return name == interestname[x];
                          });
                        }
                      });
                    }
                )
              ]),
            )
        ],
      );
  }

  List<List> csvToList(String name){
    var myCsvFile = File(name);

    CsvToListConverter c =
        new CsvToListConverter(eol: "\r\n", fieldDelimiter: ",");
    List<List> listCreated = c.convert(myCsvFile.readAsStringSync());
    return listCreated;
  }

  @override
  Widget build(BuildContext context) {
    //List interestfile = csvToList('Users/harrisonmount/Desktop/HelloWorld/hello_world/assets/Interests.csv');

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

//For First Initials Displayed in circle before text
/*avatar: CircleAvatar(
            child: Text(interest.name[0].toUpperCase()),
          ),*/