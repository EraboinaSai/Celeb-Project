import 'package:flutter/material.dart';
import 'FirstScreen.dart';
//import 'SecondScreen.dart';
import './MyProgressIndicator.dart';
import 'IntFirstScreen.dart';
class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16.0,),
          onPressed: ()=>{Navigator.pop(context)},
          padding: EdgeInsets.only(left: 25, right: 8),),
        leadingWidth: 38,
        title: MyProgressIndicator.MyAppBarTitle(3,3),
        actions: <Widget>[
          MyProgressIndicator.MyAppBarSkipButton(),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: MyProgressIndicator(currentstep:3,totalsteps: 3,),
        ),
      ),
      body:
      MyProgressIndicator.myElevatedButton('Finish',IntFirstScreen(),context),
    );
  }
}

