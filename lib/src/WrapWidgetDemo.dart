import 'package:flutter/material.dart';

class WrapWidgetDemo extends StatefulWidget {
  //
  final String title = 'Wrap Widget & Chips';

  @override
  State<StatefulWidget> createState() => _WrapWidgetDemoState();
}

class _WrapWidgetDemoState extends State<WrapWidgetDemo> {
  //

  GlobalKey<ScaffoldState> _key;
  List<String> _dynamicChips;
  bool _isSelected;
  List<Company> _companies;
  List<String> _filters;
  List<String> _choices;
  int _defaultChoiceIndex;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();
    _isSelected = false;
    _defaultChoiceIndex = 0;
    _filters = <String>[];
    _companies = <Company>[
      const Company('Google'),
      const Company('Apple'),
      const Company('Microsoft'),
      const Company('Sony'),
      const Company('Amazon'),
    ];
    _dynamicChips = ['Health', 'Food', 'Nature'];
    _choices = ['Choice 1', 'Choice 2', 'Choice 3'];
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
          Wrap(
            children: companyWidgets.toList(),
          ),
          Text('Selected: ${_filters.join(', ')}'),
        ],
      ),
    );
  }

  Iterable<Widget> get companyWidgets sync* {
    for (Company company in _companies) {
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: FilterChip(
          avatar: CircleAvatar(
            child: Text(company.name[0].toUpperCase()),
          ),
          label: Text(company.name),
          selected: _filters.contains(company.name),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filters.add(company.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == company.name;
                });
              }
            });
          },
        ),
      );
    }
  }
}

class Company {
  const Company(this.name);
  final String name;
}