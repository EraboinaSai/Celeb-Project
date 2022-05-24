import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProgressIndicator extends StatelessWidget {
  int totalsteps = 1;
  int currentstep = 1;
  final int previousColor = 0;
  final String direction = 'Next';

  static myElevatedButton(
      String myElevatedButtonText, Function onPressed2, BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext ctx)=>
          SizedBox( height:MediaQuery.of(context).size.height * 0.066,
    width: MediaQuery.of(context).size.width * 0.90,
    child:Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: ElevatedButton(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    myElevatedButtonText,
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
                  Icon(
                  Icons.arrow_forward,
                  size: 25,

                ),
               ],
            ),
            onPressed: () {
              onPressed2(context);
            },
          ),
        ),

    ),

    designSize: const Size(833,1804),
    );
  }

  MyProgressIndicator({
    this.totalsteps = 3,
    this.currentstep = 4,
  });

  @override
  Widget build(BuildContext context) {
     return StepProgressIndicator(
      customColor: (index) =>
          (++index) == currentstep ? Colors.teal : Colors.white,
      totalSteps: totalsteps,
      currentStep: currentstep,
      selectedColor: Colors.teal,
      unselectedColor: Colors.white,
    );
  }

  static ScreenUtilInit writeSFProText(
      String? randomText, Color color, double size, EdgeInsets padding) {
    return ScreenUtilInit(
      builder:(BuildContext ctx)=> Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: padding,
            child: Text(
              '$randomText',
              style: TextStyle(
                fontSize: size,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w600,
                color:color,
              ),
            ),
          )),
    );
  }

static ScreenUtilInit writeSFProText1(
String? randomText, Color color, double size, EdgeInsets padding) {
return ScreenUtilInit(
  builder:(BuildContext c)=>  Container(
  alignment: Alignment.topLeft,
  child: Padding(
  padding: padding,
  child: Text(
  '$randomText',
  style: TextStyle(
  fontSize: size,
  fontFamily: 'SFProDisplay',
  fontWeight: FontWeight.w600,
  color:color,
  ),
  ),
  )),
);
}

  static ScreenUtilInit MyAppBarSkipButton() {
    return ScreenUtilInit(
      builder:(BuildContext ctx) => TextButton(
        onPressed: () {
          print('You pressed skip button');
        },
        child: Text('Skip'),
        style: TextButton.styleFrom(
          padding:EdgeInsets.only(right:20),
          primary: Colors.orange,
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
    );
  }
}
