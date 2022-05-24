import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'IntFirstScreen.dart';
import './MyProgressIndicator.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chip();
  }
}

class Chip extends StatefulWidget
{
  @override
  _ChipState createState() => _ChipState();
}

class _ChipState extends State<Chip> {
  List<String> listPersons = [];
  List<bool> selectedList =  [false,false,false,false,false,false,];
  myThirdScreenOnPressedButton(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IntFirstScreen()),);
  }
  @override
  void initState()
  {
    super.initState();
    listPersons = ["Barack Obama", "Steve Jobs", " Sundar Pichai",  " Elon Musk", "Parag Agarwal","Jimmy Kimmel"];
  }

  @override
  Widget build(BuildContext context)
  {
    return ScreenUtilInit(
      builder:(BuildContext ctx)=> Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
            icon:  Icon(Icons.arrow_back_ios_rounded,  size: 40.h,),
            onPressed: () => {Navigator.pop(context)},
            padding:   EdgeInsets.only(left: 40.w),),
          leadingWidth: 80.w,

          title:   Text('Step 3 of 3', style: TextStyle(fontSize: 40.h,
            fontFamily: 'SFProDisplay',
            color: Colors.black,),),
          actions: <Widget>[
            TextButton(onPressed: () {   print('You pressed skip button');}, child:   Text('Skip', style: TextStyle(fontSize: 40.h,
        fontFamily: 'SFProDisplay',
      ),),),
          ],
          bottom: PreferredSize(
            preferredSize:const  Size.fromHeight(6.0),
            child: MyProgressIndicator(currentstep: 3, totalsteps: 3,),
          ),
        ),

        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyProgressIndicator.writeSFProText('Who inspires you?',Colors.black,60.h, EdgeInsets.only(left: 44.w, top:71.h),),
            MyProgressIndicator.writeSFProText1("You'll See Suggestions in the app based on your answers",Colors.grey,35.h, EdgeInsets.only(left: 44.w ,bottom: 71.h,top:26.h,right:150.w),),

            Expanded(
              child:
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemExtent: 180.h,
                itemCount: listPersons.length,
                itemBuilder: (context, index) {


                  List<String> images = [
                    "https://upload.wikimedia.org/wikipedia/commons/8/8d/President_Barack_Obama.jpg",
                    "https://imageio.forbes.com/specials-images/imageserve/615bb1e64b6b8efbb0c57d55/0x0.jpg?format=jpg&width=1200&fit=bounds",
                    "https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg",
                    "https://images.mid-day.com/images/images/2021/dec/paragag_d.jpg",
                    "https://www.looper.com/img/gallery/what-happened-to-jimmy-kimmel/l-intro-1628021874.jpg"
                  ];
                  return InkWell
                    (
                    child:Container(
                      margin:EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.025, right:MediaQuery.of(context).size.height * 0.025, bottom: MediaQuery.of(context).size.height * 0.015),

                      child:ListTile
                        (
                        shape:   RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        tileColor:selectedList[index] ? Color(0xffeaf6f6) : Color.fromRGBO(241, 242, 246, 0.8),
                        leading: CircleAvatar(backgroundImage: NetworkImage(images[index]), radius: MediaQuery.of(context).size.height * 0.025,),
                        title: Align(alignment: Alignment.centerLeft,
                          child: Text(listPersons[index],
                            style:  TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025, fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w700,),),),
                        onTap: () => setState(() => selectedList[index] = !selectedList[index]),
                      ),
                    ),
                  );
                },),
            ),
            Container(
              padding:   EdgeInsets.only(bottom: 25.h),
           child:   MyProgressIndicator.myElevatedButton('Next',myThirdScreenOnPressedButton, context),
            ),
          ],
        ),
      ),
      designSize: const Size(833,1804),
    );
  }
}



