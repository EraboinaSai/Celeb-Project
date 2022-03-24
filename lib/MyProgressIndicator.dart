import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'FirstScreen.dart';
class MyProgressIndicator extends StatelessWidget {
  int totalsteps = 1;
  int currentstep = 1;
  int previousColor= 0;
  String direction = 'Next';

  static SizedBox buildSizedBox() {
    return SizedBox(
      width: 200.0,
      height: 16.0,
    );
  }
  static Widget MyAppBarTitle(int currentstep,int totalsteps ) {
    return Text(
      'Step $currentstep of $totalsteps',
      style: TextStyle(color: Colors.black87, fontSize: 16, ),
    );
  }
  static  myElevatedButton( String myElevatedButtontext,Widget myNextScreen,BuildContext context){
    return Center(
      child:Container(
        height:48 ,
        width: 335,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            elevation: 1,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          child: Row(
            children: [
              Expanded(child: Text('$myElevatedButtontext', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700),),) ,
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 15.0,
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  (myNextScreen)),);
          },),),);}
  MyProgressIndicator({ this.totalsteps = 3, this.currentstep = 4,});
  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      customColor: (index) => (++index) == currentstep? Colors.teal : Colors.white,
      totalSteps: totalsteps,
      currentStep: currentstep,
      selectedColor: Colors.teal,
      unselectedColor: Colors.white,
    );
  }


  static TextButton MyAppBarSkipButton() {
    return TextButton(
      onPressed: () {
        print('You pressed skip button');
      },
      child: Text('Skip'),
      style: TextButton.styleFrom(
        primary: Colors.red,
        textStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
