import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './MyProgressIndicator.dart';
import 'custom_TextFormField.dart';

import 'popularQuestionsCard.dart';

class IntSecondScreen extends StatefulWidget {
  @override
  _IntSecondScreenState createState() => _IntSecondScreenState();
}

class _IntSecondScreenState extends State<IntSecondScreen> {
  Map<String, String> fieldValues = {};

  setFieldValue(label, value) {
    fieldValues[label] = value;
  }

  var thumbType = [
    "Films",
    "Psychology",
    "Politics",
    "Communication Skills",
    "Health",
    "Mindfulness",
    "Money & Investments",
    "Technology",
    "Education",
    "Religion",
    "Parenting",
    "Creativity"
  ];
  List<bool> selectedList = [];
  List<String> selectedInterests = [];
  TextEditingController nameController = TextEditingController();
  myIntSecondScreenOnPressedButton(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PopularQuestionsCard()),);
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext c)=> Scaffold(
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
          title:   Text('Step 2 of 2', style: TextStyle(fontSize: 40.h,
            fontFamily: 'SFProDisplay',
            color: Colors.black,
          ),),
          bottom: PreferredSize(
            preferredSize:   Size.fromHeight(20.h),
            child: MyProgressIndicator(
              currentstep: 2,
              totalsteps: 2,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child:Column(
          children: [
            MyProgressIndicator.writeSFProText(
              'About Channel',
                Colors.black,60.h, EdgeInsets.only(left: 44.w, top:71.h, bottom:80.h)
            ),

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

            MyProgressIndicator.writeSFProText1('Select the category of your interviews',Colors.black,45.h, EdgeInsets.only(left: 40.w ,bottom: 60.h,top:30.h,right:20.w),),

            Container(
           //   margin:   EdgeInsets.only(left: 10.0, right: 10.0),
              child: Wrap(
                children: [
                  for (int i = 0; i < thumbType.length; i++) _listItem(i)
                ],
              ),
            ),
              SizedBox(
              height:  MediaQuery.of(context).size.height * 0.18,

            ),

            MyProgressIndicator.myElevatedButton('Finish',myIntSecondScreenOnPressedButton, context),

          ],
        ),
      ),
      ),
      designSize: const Size(833,1804),
    );
  }

  Widget _listItem(int i) {
    selectedList.add(false);
    return Padding( padding:  EdgeInsets.only(left: 12.w, right: 30.w, bottom: 35.h),
      //padding around chips
      child: FilterChip(
        padding: EdgeInsets.only(left: 20.w, right:20.w,top: 11.h,bottom: 17.h),
        //padding around text
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.sw),

          side: BorderSide(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        selectedColor: Color(0xffeaf6f6),

        showCheckmark: false,
        label: Text(thumbType[i]),
        labelStyle:   TextStyle(
          fontSize: 36.sp,

        ),
        selected: selectedList[i],
        onSelected: (bool value) {
          setState(() {
            if (value) {
              selectedInterests.add(thumbType[i]);
            } else {
              selectedInterests.remove(thumbType[i]);
            }
            selectedList[i] = value;
            debugPrint("selected Interests :  $selectedInterests");
          });
        },
      ),
    );
  }
}
