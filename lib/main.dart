//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hello_world/src/login.dart';
import 'package:hello_world/src/facebookLogin.dart';
import 'package:hello_world/src/appleLogin.dart';
import 'package:hello_world/src/googleLogin.dart';
import 'package:hello_world/src/WrapWidgetDemo.dart';

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

void main() {
  runApp(MyApp());
}
//test
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(/*title: 'Flutter Demo Home Page'*/),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'HelveticaNeue', fontSize: 20.0);

  String _username = '';
  String _password = '';

  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: usernameEditingController,//controller
      onChanged: (text){
        this.setState((){
          _username = text;//when state changed
        });
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: passwordEditingController,//controller
      onChanged: (text2){
        this.setState((){
          _password = text2;//when state changed
        });
      },

      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueGrey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _sendDataToSecondScreen(context);
          //Navigator.push(
            //context, MaterialPageRoute(builder: (context) => LoginPage())
          //);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final faceBookButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => facebookLoginPage())
          );
        },
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                "assets/facebook.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width:15,
            ),
            Text("Continue with Facebook",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );

    final googleButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => googleLoginPage())
          );
        },
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                "assets/google.jpg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width:15,
            ),
            Text("Login with Google",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );

    final appleButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WrapWidgetDemo())
              //CHANGE BACK TO appleLoginPage
          );
        },
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                "assets/apple.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width:15,
            ),
            Text("Continue with Apple ID",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );


    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/globe_logo@3x.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 25.0),
                Text(
                  'Welcome to Hello World!',
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      fontSize: 27.0,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(height: 10.0),
                faceBookButton,
                SizedBox(height: 10.0),
                googleButton,
                SizedBox(height: 10.0),
                appleButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = usernameEditingController.text;
    String textToSend2 = passwordEditingController.text;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(text: textToSend,text2: textToSend2),
        ));
  }

}