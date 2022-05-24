import 'package:celeb_project/main.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'MyProgressIndicator.dart';
import 'package:celeb_project/FirstScreen.dart';
class PopularQuestionsCard extends StatefulWidget {
  const PopularQuestionsCard({Key? key}) : super(key: key);
  @override
  State<PopularQuestionsCard> createState() => _PopularQuestionsCardState();
}
class _PopularQuestionsCardState extends State<PopularQuestionsCard> {
  @override
  myPopularQuestionsCardOnPressedButton(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  FirstScreen()),);
  }
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child:Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 70, 20, 500),
        child: Card(
          elevation: 8.0,
          //  clipBehavior: Clip.antiAlias,
            child: Column(
              children: [

                ListTile(
                  leading:const  CircleAvatar(backgroundImage: NetworkImage(  "https://upload.wikimedia.org/wikipedia/commons/8/8d/President_Barack_Obama.jpg" ),),
                  title: Row(
                    children: const [
                       Text('Ariana Grande',
                       style:  TextStyle(
                       fontSize: 20,
                       fontFamily: 'SFProDisplay',
                       fontWeight: FontWeight.w900,
                       color: Colors.black,
                        ),
                      ),

                      Icon(Icons.check_circle,
                    size: 17.0,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(80.0,10.0,0,0.0),
                        child: Icon(Icons.more_horiz),
                      )
                    ],
                  ),
                  subtitle:  RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "from",
                          style: TextStyle(color: Colors.black87)),
                      TextSpan(
                          text: " Alisia Park ",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),

                      TextSpan(
                          text: " 3d ago ",
                          style: TextStyle(color: Colors.black87)),
                    ]),
                  ),
                ),

                const Padding(
                  padding:  EdgeInsets.all( 10),
                  child: Text(
                    'Tell us about yourself,your business.',
                    style:  TextStyle(color: Colors.black,
                      fontSize: 18,
                    fontWeight: FontWeight.w500),
                  ),
                ),
              const  Padding(
                  padding:  EdgeInsets.all(20.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    LikeButton(
                      size: 30,
                      likeCount: 0,
                      likeBuilder: (bool like) {
                        return const Padding(
                          padding:  EdgeInsets.all(4.0),
                          child: Icon(
                          Icons.thumb_up_outlined,
                          color: Colors.red,
                        ),
                        );
                      },
                    ),
                    LikeButton(
                      size: 30,
                      likeCount: 0,
                      likeBuilder: (bool like) {
                        return const Padding(
                          padding:  EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.thumb_up,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),

                  ],
                ),
                MyProgressIndicator.myElevatedButton('Next',myPopularQuestionsCardOnPressedButton, context),

              ],
            )),
      ),
     ),
      );
  }
}
