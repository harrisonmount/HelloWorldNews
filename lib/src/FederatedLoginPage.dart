import 'package:flutter/material.dart';
import 'package:hello_world/src/OnBoarding.dart';
import 'package:hello_world/src/facebookLogin.dart';
import 'package:hello_world/src/appleLogin.dart';
import 'package:hello_world/src/googleLogin.dart';


class FederatedPage extends StatefulWidget {
  @override
  _FederatedPageState createState() => _FederatedPageState();
}



class _FederatedPageState extends State<FederatedPage> {
  TextStyle style = TextStyle(fontFamily: 'HelveticaNeue', fontSize: 20.0);



  @override
  Widget build(BuildContext context) {

    final faceBookButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OnBoarding(text: "text", text2: "test"))
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
              context, MaterialPageRoute(builder: (context) => appleLoginPage())
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
          child: SingleChildScrollView(
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
                  SizedBox(height: 35.0),
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
      ),
    );
  }
}