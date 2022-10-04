import 'package:driveu/ui/screens/bottom_nav_items/bottom_navigation.dart';
import 'package:driveu/ui/screens/bottom_nav_items/home_screen.dart';
import 'package:driveu/ui/widgets/my_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthUser {
  Future createUserAccount(String emailAddress,String password,context)async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      var authCredential = credential.user;
      if(authCredential!.uid.isNotEmpty){
        MySnack().showSnack(context, const Text("Registration Successful"));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
      } else {
        MySnack().showSnack(context, const Text("Sign Up Failed"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MySnack().showSnack(context, const Text("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        MySnack().showSnack(context, const Text("The account already exists for that email"));
      }
    } catch (e) {
      MySnack().showSnack(context, Text("Error is: $e"));
    }
  }
  Future signInUser(String emailAddress,String password,context)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      var authCredential = credential.user;
      if(authCredential!.uid.isNotEmpty){
        MySnack().showSnack(context, const Text("Login Successful"));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
      } else {
        MySnack().showSnack(context, const Text("Login Failed"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        MySnack().showSnack(context, Text("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        MySnack().showSnack(context, Text("Wrong password provided for that user."));
      }
    }
  }
  // Future signInWithGoogle(context) async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   UserCredential result =  await FirebaseAuth.instance.signInWithCredential(credential);
  //   User? user = result.user;
  //   if(user!.uid.isNotEmpty){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  //   }
  // }
}