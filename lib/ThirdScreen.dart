// import 'package:flutter/material.dart';
// import 'FirstScreen.dart';
// //import 'SecondScreen.dart';
// import './MyProgressIndicator.dart';
// import 'IntFirstScreen.dart';
// class ThirdScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16.0,),
//           onPressed: ()=>{Navigator.pop(context)},
//           padding: EdgeInsets.only(left: 25, right: 8),),
//         leadingWidth: 38,
//         title: MyProgressIndicator.MyAppBarTitle(3,3),
//         actions: <Widget>[
//           MyProgressIndicator.MyAppBarSkipButton(),
//         ],
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(6.0),
//           child: MyProgressIndicator(currentstep:3,totalsteps: 3,),
//         ),
//       ),
//       body:
//       MyProgressIndicator.myElevatedButton('Finish',IntFirstScreen(),context),
//     );
//   }
// }

import 'package:celeb_project/IntFirstScreen.dart';
import 'package:flutter/material.dart';
//import 'FirstScreen.dart';
import 'package:multi_select_item/multi_select_item.dart';
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
  MultiSelectController myMultiSelectController = MultiSelectController();

  @override
  void initState() {
    super.initState();
    listPersons = ["Barack Obama", "Steve Jobs", " Sundar Pichai",  " Elon Musk", "Parag Agarwal","Jimmy Kimmel"];

    myMultiSelectController.disableEditingWhenNoneSelected = false;
    myMultiSelectController.set(listPersons.length);

  }
  void deleteItems() {
    var list = myMultiSelectController.selectedIndexes;
    list.sort((b, a) => a.compareTo(b));
    for (var element in list) {
      listPersons.removeAt(element);
    }
    setState(() {
      myMultiSelectController.set(listPersons.length);
    });
  }
  void selectAllItems() {
    setState(() {
      myMultiSelectController.toggleAll();
    });
  }
  void selectAll() {
    setState(() {
      myMultiSelectController.toggleAll();
    });
  }
  var persons = [
    "Barack Obama",
    "Steve Jobs",
    " Sundar Pichai",
    "Jeff Bezos",
    " Elon Musk",
    "Parag Agarwal"
  ];
  List<String> images = [
    "https://upload.wikimedia.org/wikipedia/commons/8/8d/President_Barack_Obama.jpg",
    "https://imageio.forbes.com/specials-images/imageserve/615bb1e64b6b8efbb0c57d55/0x0.jpg?format=jpg&width=1200&fit=bounds",
    "https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg",
    "https://images.mid-day.com/images/images/2021/dec/paragag_d.jpg",
    "https://www.looper.com/img/gallery/what-happened-to-jimmy-kimmel/l-intro-1628021874.jpg"
  ];
  List<bool> listOfpersons = [];
  List<String> selectpersons = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    centerTitle: false,
    leading: IconButton(
    icon: Icon(Icons.arrow_back_ios_rounded, size: 16.0,),
      onPressed: () => {Navigator.pop(context)},
    padding: EdgeInsets.only(left: 25, right: 8),),
    leadingWidth: 38,
    title: MyProgressIndicator.MyAppBarTitle(3, 3),
    actions: <Widget>[
    MyProgressIndicator.MyAppBarSkipButton(),
    ],
    bottom: PreferredSize(
    preferredSize: Size.fromHeight(6.0),
    child: MyProgressIndicator(currentstep: 3, totalsteps: 3,),
    ),
    ),

    body:
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Container(child: const Text("Who inspires you?", style: TextStyle(
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w700,
    color: Colors.black, fontSize: 35.0,),),
    margin: const EdgeInsets.only(top: 30, right: 60),
    padding: const EdgeInsets.only(right: 30,),
    ),
    Container(child: const Text(
    "You'll See Suggestions in the app based on your answers",
    textAlign: TextAlign.left,

    style: TextStyle(color: Colors.grey,
    fontFamily: 'SFProDisplay',
    fontSize: 19.0,),),
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.only(left: 20, right: 40, bottom: 20),),
    Expanded(
    child: ListView.builder(
    itemCount: listPersons.length,
    itemExtent: 90,
    itemBuilder: (context, index) {
    var images=[
    "https://upload.wikimedia.org/wikipedia/commons/8/8d/President_Barack_Obama.jpg", "https://imageio.forbes.com/specials-images/imageserve/615bb1e64b6b8efbb0c57d55/0x0.jpg?format=jpg&width=1200&fit=bounds",
    "https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg", "https://upload.wikimedia.org/wikipedia/commons/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg",
    "https://images.mid-day.com/images/images/2021/dec/paragag_d.jpg",  "https://www.looper.com/img/gallery/what-happened-to-jimmy-kimmel/l-intro-1628021874.jpg"
    ];
    return InkWell(
    onTap: () {},
    child: MultiSelectItem(
    isSelecting: myMultiSelectController.isSelecting,
    onSelected: () {
    setState(() {
    myMultiSelectController.toggle(index);
    });
    },

    child: Container(
    margin:EdgeInsets.only(left:20, right:20, top:7, bottom: 7),
    child:ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    tileColor: myMultiSelectController.isSelected(index) ? Color(0xffeaf6f6) : Color.fromRGBO(241, 242, 246, 0.8),
    leading: CircleAvatar(backgroundImage: NetworkImage(images[index]),  radius:25.0,),
    title: Align(alignment: Alignment.centerLeft,child:Text(listPersons[index],  style: TextStyle(fontSize: 24, fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w700, ), ),),
    ),
    ),
    ),
    );

    }
    ),
    ),
    Container( padding: EdgeInsets.only(bottom: 40),
    child: MyProgressIndicator.myElevatedButton('Finish', IntFirstScreen(),context),
    ),
    ],
    ),
    );

  }
}

