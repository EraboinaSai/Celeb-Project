import 'package:celeb_project/ThirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './MyProgressIndicator.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var thumbType = [
    "Films", "Psychology", "Politics", "Communication Skills", "Health",
    "Mindfulness", "Money & Investments", "Technology", "Education",
    "Religion", "Parenting", "Creativity"
  ];
  List<bool> selectedList = [];
  List<String> selectedInterests = [];
  TextEditingController nameController = TextEditingController();

  mySecondScreenOnPressedButton(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThirdScreen()),);
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext ctx) =>Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
            icon:   Icon(
              Icons.arrow_back_ios_rounded,
              size: 40.h,
            ),
            onPressed: () => {Navigator.pop(context)},
            padding:   EdgeInsets.only(left: 45.w,),
          ),
          leadingWidth: 80.w,
          title:   Text('Step 2 of 3', style: TextStyle(fontSize: 40.h,
          fontFamily: 'SFProDisplay',
          color: Colors.black,
        ),),
        actions: <Widget>[
        TextButton(onPressed: () { print('You pressed skip button');}, child: Text('Skip', style: TextStyle(fontSize: 40.h,
    fontFamily: 'SFProDisplay',
    ),),
        ),],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(6.0),
            child: MyProgressIndicator(
              currentstep: 2,
              totalsteps: 3,
            ),
          ),

        ),
        body: SingleChildScrollView(
        child: Column(
          children: [
            MyProgressIndicator.writeSFProText('Choose your interests',Colors.black,60.h, EdgeInsets.only(left: 44.w, top:71.h),),
            MyProgressIndicator.writeSFProText1('This will help us to more accurately recommend content.',Colors.grey,35.h, EdgeInsets.only(left: 44.w ,bottom: 71.h,top:26.h,right:90.w),),

            // Container(
            //     child:   Text(
            //       "This will help us to more accurately recommend content.",
            //       textAlign: TextAlign.left,
            //       style: TextStyle(
            //         color: Color.fromRGBO(118, 118, 118, 0.7),
            //         fontFamily: 'SFProDisplay',
            //         fontSize: 19.0,
            //       ),
            //     ),
            //  //   margin:   EdgeInsets.all(10.0),
            //     padding:   EdgeInsets.only(left: 34.h, right: 20, bottom: 34.h)),
            Container(

              child: Wrap(
                children: [
                  for (int i = 0; i < thumbType.length; i++) _listItem(i)
                ],
              ),
            ),
            SizedBox(
              height: 400.h,

            ),
            MyProgressIndicator.myElevatedButton('Next',  mySecondScreenOnPressedButton, context),
          ],
        ),
      ),
      ),
      designSize: const Size(833,1804),

    );
  }

  Widget _listItem(int i) {
    selectedList.add(false);
    return   Padding(padding:  EdgeInsets.only(left: 15.w, right: 25.w, bottom: 40.h),
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
        labelStyle: TextStyle(
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
