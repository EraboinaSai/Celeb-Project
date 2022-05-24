import 'package:celeb_project/IntSecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import './MyProgressIndicator.dart';
 import 'custom_TextFormField.dart';
import 'IntSecondScreen.dart';

class IntFirstScreen extends StatefulWidget {
  @override
  State<IntFirstScreen> createState() => _IntFirstScreenState();
}

class _IntFirstScreenState extends State<IntFirstScreen> {
  Map<String, String> fieldValues = {};

  setFieldValue(label, value) {
    fieldValues[label] = value;
  }
  bool _isObscure = true;
  myIntFirstScreenOnPressedButton(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IntSecondScreen()),);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
            icon:   Icon(
              Icons.arrow_back_ios_rounded,
              size: 40.h,
            ),
            onPressed: () => {Navigator.pop(context)},
            padding:   EdgeInsets.only(left: 45.w),
          ),
          leadingWidth: 80.w,
          title:   Text('Step 1 of 2', style: TextStyle(fontSize: 40.h,
            fontFamily: 'SFProDisplay',
            color: Colors.black,
          ),),
          bottom: PreferredSize(
            preferredSize:   Size.fromHeight(20.h),
            child: MyProgressIndicator(
              currentstep: 1,
              totalsteps: 2,
            ),
          ),
        ),
        body:
        SingleChildScrollView(

        child:Column(children: [
          MyProgressIndicator.writeSFProText('Sign in', Colors.black,60.h, EdgeInsets.symmetric(horizontal: 44.w,vertical: 70.h),),

          CustomTextFormField(
              labelText: 'Enter the email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field is required.';
                }
                String pattern = r'\w+@\w+\.\w+';
                if (!RegExp(pattern).hasMatch(value)) {
                  return 'Invalid E-mail Address format.';
                }
                return null;
              },
              onSaved: (value) => fieldValues['E-mail'] = value!),
          Padding(
            padding:   EdgeInsets.only(left: 47.w, right:47.w,top: 10.h),
            child: TextFormField(

                obscureText: _isObscure,
                decoration: InputDecoration(
                  contentPadding:   EdgeInsets.only(left: 35.w),
                  border:   OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w),
                  ),
                  labelText: 'Password',
                  errorMaxLines: 3,
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      _isObscure
                          ? 'assets/Icons/Pass Icon.svg'
                          : 'assets/Icons/Frame 3343.svg',
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required.';
                  }
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  if (!RegExp(pattern).hasMatch(value)) {
                    return
                      ' must be at least 8 characters,'
                          'include an uppercase letter, number and symbol.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    fieldValues['Password'] = value!;
                  });
                }),
          ),
            SizedBox(
            height: 900.h,

          ),

          MyProgressIndicator.myElevatedButton('Next',myIntFirstScreenOnPressedButton, context),

        ]),

    ),
    );
    // , designSize: const Size(833,1804),
    // );
  }
  ScreenUtilInit CustomTextFormField(
      {
        required String labelText,
        final String? Function(String?)? validator,
        final String? Function(String?)? onSaved,
      }) {
    return ScreenUtilInit(
      builder:(BuildContext c)=> Container(
        // padding:   EdgeInsets.only(left: 20.w,right:20.w, bottom: 10.h),
        width: MediaQuery.of(context).size.width * 0.89,

        height: MediaQuery.of(context).size.width * 0.15,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding:   EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
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
    );
  }

}
