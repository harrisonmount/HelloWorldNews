import 'package:flutter/material.dart';


class facebookLoginPage extends StatelessWidget {
  facebookLoginPage({Key key, this.title}) : super(key: key);
  final String title;
  TextStyle style = TextStyle(fontFamily: 'HelveticaNeue', fontSize: 20.0);

  @override
  //_LoginPageState createState() => _LoginPageState();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Login"),
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
                        "facebook login screen",
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