import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'FirstScreen.dart';
//import './MyProgressIndicator.dart';

class SplashScreen extends StatelessWidget {
  mySplashScreenOnPressedButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => (const FirstScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit( designSize: Size(375,812),
      builder:(BuildContext c)=> Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.amberAccent,
          title: Text(
            'Welcome',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // body:MyProgressIndicator.myElevatedButton('Next',mySplashScreenOnPressedButton,context),
        body: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstScreen()),
              );
            },
            child:  Text('Next')),
      ),
    );
  }
}
