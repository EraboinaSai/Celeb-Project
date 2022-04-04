import 'package:flutter/material.dart';
import 'FirstScreen.dart';
import './MyProgressIndicator.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amberAccent,
        title: Text('Welcome'),
      ),
      body: MyProgressIndicator.myElevatedButton('Sign Up',FirstScreen(),context),
    );
  }
}
