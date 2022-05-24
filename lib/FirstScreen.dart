import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'custom_TextFormField.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import './MyProgressIndicator.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat('dd.MM.yyyy');
  DateTime focusedDay = DateTime.now();

  TextEditingController dateCtl = TextEditingController();
  final TextEditingController _date = TextEditingController();
  TextEditingController dob = TextEditingController();
  DateTime? date = DateTime.now();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? dropdownValue;

  bool _isObscure = true;
  Map<String, String> fieldValues = {};

  setFieldValue(label, value) {
    fieldValues[label] = value;
  }

  myFirstScreenOnPressedButton(BuildContext context) {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      fieldValues.forEach((label, value) => print('$label = $value'));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext ctx)=> Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
            icon:   Icon(
              Icons.arrow_back_ios_rounded,
              size: 40.h,
            ),
            onPressed: () => { Navigator.pop(context)},
            padding:   EdgeInsets.only(left: 45.w),
          ),
          leadingWidth: 80.w,

          title:  Text('Step 1 of 3', style: TextStyle(fontSize: 40.h,
            fontFamily: 'SFProDisplay',
             color: Colors.black,
          ),),
          actions: <Widget>[
            TextButton(onPressed: () { print('You pressed skip button');}, child: Text('Skip', style: TextStyle(fontSize: 40.h,
              fontFamily: 'SFProDisplay',
               ),)),
           // MyProgressIndicator.MyAppBarSkipButton(),
                ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20.h),
            child: MyProgressIndicator(
              currentstep: 1,
              totalsteps: 3,
            ),
          ),
        ),
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(children: [
              MyProgressIndicator.writeSFProText('Sign Up', Colors.black,60.h, EdgeInsets.symmetric(horizontal: 44.w,vertical: 70.h),),


              CustomTextFormField(
                  labelText: 'Name',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    if (value.trim().length < 4) {
                      return 'Username must be at least 4 characters in length';
                    }
                    return null;
                  },
                  onSaved: (value) => fieldValues['Name'] = value!),
              CustomTextFormField(
                  labelText: 'Surname',

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    if (value.trim().length < 4) {
                      return 'Username must be at least 4 characters in length';
                    }
                    return null;
                  },

                  onSaved: (value) => fieldValues['Surname'] = value!),
              Padding(
                padding: EdgeInsets.only(left: 47.w,right:47.w,  bottom: 40.h,),
                child: GestureDetector(
                  onTap: () async {
                    DateTime? newDateTime = await showRoundedDatePicker(
                      context: context,
                      firstDate: DateTime(2000, 1),
                      lastDate: DateTime(2023),
                      background: Colors.white,
                      styleDatePicker: MaterialRoundedDatePickerStyle(
                        textStyleDayButton: const TextStyle(
                            fontSize: 20, fontFamily: 'SFProDisplay'),
                        textStyleYearButton: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textStyleDayHeader: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(170, 170, 170, 3.0)),
                        textStyleCurrentDayOnCalendar: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textStyleDayOnCalendar:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        textStyleDayOnCalendarSelected: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textStyleMonthYearHeader: const TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        paddingDatePicker:
                            const EdgeInsets.only(left: 10, right: 10),
                        paddingMonthHeader: const EdgeInsets.all(20),
                        paddingDateYearHeader: const EdgeInsets.all(10),
                        sizeArrow: 27,
                        colorArrowNext: Colors.black,
                        colorArrowPrevious: Colors.black,
                        marginLeftArrowPrevious: 16,
                        marginTopArrowPrevious: 16,
                        marginTopArrowNext: 16,
                        marginRightArrowNext: 16,
                        textStyleButtonPositive: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(101, 147, 150, 3.0),
                          fontWeight: FontWeight.bold,
                        ),
                        textStyleButtonNegative: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(170, 170, 170, 3.0),
                          fontWeight: FontWeight.bold,
                        ),
                        decorationDateSelected: const BoxDecoration(
                            color: Color.fromRGBO(101, 147, 150, 3.0),
                            shape: BoxShape.circle),
                        backgroundPicker: Colors.white,
                        backgroundActionBar: Colors.white,
                        backgroundHeaderMonth: Colors.white,
                        backgroundHeader: Colors.white,
                      ),
                      styleYearPicker: MaterialRoundedYearPickerStyle(
                        textStyleYear:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        textStyleYearSelected: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color.fromRGBO(101, 147, 150, 3.0),
                        ),
                        backgroundPicker: Colors.white,
                      ),
                      textPositiveButton: "Set Date",
                      textNegativeButton: "Cancel",
                      customWeekDays: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
                      onTapDay: (DateTime dateTime, bool available) {
                        if (!available) {
                          showDialog(
                              context: context,
                              builder: (c) => CupertinoAlertDialog(
                                    title: const Text(
                                        "This date cannot be selected."),
                                    actions: <Widget>[
                                      CupertinoDialogAction(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ));
                        }
                        return available;
                      },
                    );
                    if (newDateTime != null) {
                      setState(() => selectedDay = newDateTime);
                      _date.value =
                          TextEditingValue(text: formatter.format(newDateTime));
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _date,
                      keyboardType: TextInputType.datetime,
                      decoration:   InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Date of Birth(dd.MM.yyyy)',
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
            //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.025, right:MediaQuery.of(context).size.height * 0.025, bottom:MediaQuery.of(context).size.height * 0.020),
              padding: EdgeInsets.only(left:47.w,right:47.w,bottom: 40.h),
                 child: DropdownButtonFormField(
                    value: dropdownValue,
                    icon: Container(
                     // padding:   EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                       color:   Color(0xffeaf6f6),
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.066),
                      ),
                      child: SvgPicture.asset(
                        "assets/Icons/Trailing Icon.svg",
                      ),
                    ),
                    items:   [
                      DropdownMenuItem<String>(
                          child: Text('Male'), value: 'Male'),
                      DropdownMenuItem<String>(
                          child: Text('Female'), value: 'Female'),
                      DropdownMenuItem<String>(
                          child: Text('Others'), value: 'Others'),
                    ],
                    hint:  Text('Gender'),
                    decoration:   InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01, bottom:MediaQuery.of(context).size.height * 0.01, left: 16.0,right:16),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    validator: (value) {
                      if (dropdownValue == null) {
                        return 'You must select Gender';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        fieldValues['Drop Down'] = value.toString();
                      });
                    }),
              ),


              CustomTextFormField(
                  labelText: 'Enter the email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Field is required.';
                    }
                    String pattern = r'\w+@\w+\.\w+';
                    if (!RegExp(pattern).hasMatch(value)) {
                      return 'Invalid E-mail Address format.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      fieldValues['E-mail'] = value!;
                    });
                  }),
              Padding(
                 padding: EdgeInsets.only(left: 47.w,right:47.w,),
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
                height: 300.h,
                width: 350.w,
              ),
              MyProgressIndicator.myElevatedButton('Next',myFirstScreenOnPressedButton, context),
            ]),
          ),
        ),
      ),

      designSize: const Size(833,1804),

    );

  }
  ScreenUtilInit CustomTextFormField(
      {
        required String labelText,
        final String? Function(String?)? validator,
        final String? Function(String?)? onSaved,
      }) {
    return ScreenUtilInit(
      builder: (BuildContext c) =>
          Container(
            width: MediaQuery.of(context).size.width * 0.89,
           //padding:EdgeInsets.only(bottom:40.h),
            height: MediaQuery.of(context).size.height * 0.075,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015,
                    horizontal: MediaQuery.of(context).size.width * 0.03
                  ),
                border: OutlineInputBorder(),
                labelText: labelText,
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
