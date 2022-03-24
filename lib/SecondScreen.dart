//import 'package:flash_chat/main.dart';
import 'package:flutter/material.dart';
//import 'FirstScreen.dart';
import 'ThirdScreen.dart';
import './MyProgressIndicator.dart';
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChipsDemo();
  }
}
class ChipsDemo extends StatefulWidget {
  @override
  _ChipsDemoState createState() => _ChipsDemoState();
}
class _ChipsDemoState extends State<ChipsDemo> {
  var thumbType=["Films", "Psychology", "Politics", "Communication Skills", "Health",
    "Mindfulness", "Money & Investments", "Technology", "Education","Religion","Parenting","Creavity"];
  List<bool> selectedList=[];
  List<String> selectedInterests=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16.0,),
          onPressed: ()=>{Navigator.pop(context)},
          padding: EdgeInsets.only(left: 25, right: 8),),
        leadingWidth: 38,
        title: MyProgressIndicator.MyAppBarTitle(2,3),
        actions: <Widget>[
          MyProgressIndicator.MyAppBarSkipButton(),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: MyProgressIndicator(currentstep:2,totalsteps: 3, ),
        ),
      ),

      body: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 0, 32),
                child: const Text(
                  'Choose your Interests',
                  style: TextStyle(fontSize: 24,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              )
          ),

          Wrap(
            children: [
              for(int i=0;i<thumbType.length;i++) _listItem(i)
            ],
          ),
          SizedBox(height: 156, width: 350,),
          MyProgressIndicator.myElevatedButton('Next',ThirdScreen(),context),
        ],
      ),

    );
  }
  Widget _listItem(int i) {
    selectedList.add(false);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 3),
        child: FilterChip(
          showCheckmark: false,
          label: Text(thumbType[i]),
          selected: selectedList[i],
          onSelected: (bool value) {
            setState(() {
              if(value){
                selectedInterests.add(thumbType[i]);
              }else{
                selectedInterests.remove(thumbType[i]);
              }
              selectedList[i]=value;
              debugPrint("selected Interests :  $selectedInterests");
            });
          },
        ),
      ),
    );
  }
}




