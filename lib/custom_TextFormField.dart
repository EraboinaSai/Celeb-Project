import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ScreenUtilInit CustomTextFormField(
    {
      required String labelText,
      final String? Function(String?)? validator,
      final String? Function(String?)? onSaved,
     }) {
  return ScreenUtilInit(
    builder:(BuildContext c)=> Container(
      padding:   EdgeInsets.only(left: 47.w,right:47.w, bottom: 30.h),
    //  width: MediaQuery.of(context).size.width * 0.89,

     // height: MediaQuery.of(context).size.width * 0.15,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:    EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
          border: OutlineInputBorder(),
          labelText:labelText,
          hintStyle: TextStyle(
            fontSize: 35.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        validator: validator,
        onSaved: onSaved,
        onChanged: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    ),

    designSize: const Size(833,1804),

  );
}
/*ScreenUtilInit CustomTextFormField(
    {
      required String labelText,
      final String? Function(String?)? validator,
      final String? Function(String?)? onSaved,
    }) {
  return ScreenUtilInit(
    builder:(BuildContext c)=> Container(
      width:  700.h,
      height: 60.h,

      margin:   EdgeInsets.only(left: 20.w,right:20.w,bottom:0.h),
      child: TextFormField(


        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left:20,top:10,bottom:10),

          border: OutlineInputBorder(),
          labelText:labelText,
          hintStyle: TextStyle(
            fontSize: 35.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        validator: validator,
        onSaved: onSaved,
        onChanged: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    ),
  );}
*/
