import 'package:flutter/material.dart';
import './MyProgressIndicator.dart';
import 'SplashScreen.dart';
class IntSecondScreen extends StatelessWidget {
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
    "Mindfulness", "Money & Investments", "Technology", "Education","Religion","Parenting","Creativity"];
  List<bool> selectedList=[];
  List<String> selectedInterests=[];
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16.0,),
          onPressed: ()=>{Navigator.pop(context)},
          padding: EdgeInsets.only(left: 25, right: 8),),
        leadingWidth: 38,
        title: MyProgressIndicator.MyAppBarTitle(2,2),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: MyProgressIndicator(currentstep:2,totalsteps:2,),
        ),
      ),

      body: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 0, 32),
                child: const Text(
                  'About channel',
                  style: TextStyle(fontSize: 24,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                ),
              )
            ),
          Container(
            width: 335.0,
            height: 48.0,
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
         // buildSFProTextContainer(),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Wrap(
              children: [
                for(int i=0;i<thumbType.length;i++) _listItem(i)
              ],
            ),
          ),
          SizedBox(height: 100, width: 350,),
          MyProgressIndicator.myElevatedButton('Finish',SplashScreen(),context),
        ],
      ),
    );
  }


  Widget _listItem(int i) {
    selectedList.add(false);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 6,top: 6,bottom: 14),//padding around chips
        child: FilterChip(
          padding: EdgeInsets.symmetric(vertical: 11,horizontal: 4),//padding around text
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xffd0d0d6)),
          ),
          backgroundColor: Color(0xfffffffff),
          selectedColor: Color(0xffeaf6f6),
          showCheckmark: false,
          label: Text(thumbType[i]),
          labelStyle: TextStyle(
            fontSize: 17,
          ),
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
            }
            );
          },
        ),
      ),
    );
  }
}




