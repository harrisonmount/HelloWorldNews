import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "signed up!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  Future<String> signInWithGoogle() async {
    try{
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return "signed in!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  /*
  Future signInWithApple() async {
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final AppleIdCredential _auth = result.credential;
        final OAuthProvider oAuthProvider = new OAuthProvider(providerId: "apple.com");
        final AuthCredential credential = oAuthProvider.getCredential(
          idToken: String.fromCharCodes(_auth.identityToken),
          accessToken: String.fromCharCodes(_auth.authorizationCode),
        );
        await _firebaseAuth.signInWithCredential(credential);
        // update the user information
        if (_auth.fullName != null) {
          user.displayName = "${_auth.fullName.givenName} ${_auth.fullName.familyName}";
          await FirebaseAuth.instance.currentUser.updateProfile(displayName:user.displayName);
            _firebaseAuth.currentUser().then( (value) async {
            UserUpdateInfo user = UserUpdateInfo();
            await value.updateProfile(user);
          });
        }
        break;
      case AuthorizationStatus.error:
        print("Sign In Failed ${result.error.localizedDescription}");
        break;
      case AuthorizationStatus.cancelled:
        print("User Cancelled");
        break;
    }
  }
  */
  Future<String> signInWithFaceBook() async {
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        //AuthCredential credential= FacebookAuthProvider.getCredential(accessToken: accessToken.token);
        //credential = FacebookAuthProvider.credential(accessToken: result.accessToken);
        AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
        await FirebaseAuth.instance.signInWithCredential(credential);
        /*
        _showMessage('''
         Logged in!

         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
         */
        return "logged in!";
      case FacebookLoginStatus.cancelledByUser:
        return "login cancelled.";
    //_showMessage('Login cancelled by the user.');
      case FacebookLoginStatus.error:
        return "FaceBook login error!!";
    /*
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
         */
    }
  }
/*
  class NameValidator {
    static String validate(String value) {
      if (value.isEmpty) {
        return "Name can't be empty";
      }
      if (value.length < 2) {
        return "Name must be at least 2 characters long";
      }
      if (value.length > 50) {
        return "Name must be less than 50 characters long";
       }
      return null;
    }
  }
  class EmailValidator {
  static String validate(String value) {
  if (value.isEmpty) {
  return "Email can't be empty";
  }
  return null;
  }
  }
  class PasswordValidator {
  static String validate(String value) {
  if (value.isEmpty) {
  return "Password can't be empty";
  }
  return null;
  }
  */


}