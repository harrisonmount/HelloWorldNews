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

