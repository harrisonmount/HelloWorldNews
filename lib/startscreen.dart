import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_world/src/sign_in_page.dart';
import 'package:hello_world/helper/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/src/home.dart';

import 'package:hello_world/src/newhome.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
              future: _fbApp,
              builder: (context, snapshot){
                print(snapshot.toString());
                if(snapshot.hasError){
                  print("you have an error! ${snapshot.error.toString()}");
                  return Text("Something went wrong");
                } else if (snapshot.hasData){
                  return AuthenticationWrapper();
                }else{
                  print("I am here!!");
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

              }
          )
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return newHome();
    }
    return SignInPage();
  }
}