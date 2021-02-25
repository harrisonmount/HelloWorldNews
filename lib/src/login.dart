//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key, @required this.text, @required this.text2, this.title}) : super(key: key);
  final String text;
  final String text2;
  final String title;
  TextStyle style = TextStyle(fontFamily: 'HelveticaNeue', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Login Success"),
      ),*/
      body: Center(
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: style.copyWith(
                            fontSize: 27.0,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        text2,
                        style: style.copyWith(
                            fontSize: 27.0,fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Logout'))
                    ],
                  )
              )
          )
      ),
    );
  }
}

/*class ActorFilterEntry {
  const ActorFilterEntry(this.name, this.initials);
  final String name;
  final String initials;
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, @required this.text, @required this.text2, this.title}) : super(key: key);
  final String text;
  final String text2;
  final String title;
  @override
  State createState() => CastFilterState();
}

class CastFilterState extends State<LoginPage> {
  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('Aaron Burr', 'AB'),
    const ActorFilterEntry('Alexander Hamilton', 'AH'),
    const ActorFilterEntry('Eliza Hamilton', 'EH'),
    const ActorFilterEntry('James Madison', 'JM'),
  ];
  List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets sync* {
    for (final ActorFilterEntry actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          avatar: CircleAvatar(child: Text(actor.initials)),
          label: Text(actor.name),
          selected: _filters.contains(actor.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: actorWidgets.toList(),
        ),
        Text('Look for: ${_filters.join(', ')}'),
      ],
    );
  }
}*/

