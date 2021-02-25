import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';

class googleLoginPage extends StatelessWidget {
  googleLoginPage({Key key, this.title}) : super(key: key);
  final String title;
  TextStyle style = TextStyle(fontFamily: 'HelveticaNeue', fontSize: 20.0);

  @override
  //_LoginPageState createState() => _LoginPageState();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Login"),
      ),
      body: Center(
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "google login screen",
                        style: style.copyWith(
                            fontSize: 27.0,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Go back'))
                    ],
                  )
              )
          )
      ),
    );
  }
}