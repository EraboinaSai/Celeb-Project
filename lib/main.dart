import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'SplashScreen.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: Size(375, 812), splitScreenMode: false,

    builder: (BuildContext c)=> MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        primaryTextTheme:  TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w500,fontFamily:'SFProDisplay',color: Colors.black ),
        ),
        appBarTheme:   AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.orange,
            textStyle:
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          primary: Colors.black,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),

      //  IconThemeData
        ),
      ),
      home: SplashScreen(),
      routes:   {},
    ),
    );
  }
}
