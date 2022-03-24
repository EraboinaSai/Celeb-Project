import 'package:flutter/material.dart';
import './MyProgressIndicator.dart';
import 'IntSecondScreen.dart';
class IntFirstScreen extends StatefulWidget {
  @override
  State<IntFirstScreen> createState() => _IntFirstScreenState();
}
class _IntFirstScreenState extends State<IntFirstScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16.0,),
          onPressed: ()=>{Navigator.pop(context)},
          padding: EdgeInsets.only(left: 25, right: 8),),
        leadingWidth: 38,
        title: MyProgressIndicator.MyAppBarTitle(1,2),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: MyProgressIndicator(currentstep: 1, totalsteps: 2,),
        ),
      ),
      body: Column(
          children: [
            MyProgressIndicator.buildSizedBox(),
            Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 32, 0, 32),
                  child: const Text(
                    'Sign Up',
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
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder( ),
                  labelText: 'Enter the email',
                ),
              ),
            ),
            MyProgressIndicator.buildSizedBox(),
            Container(
              width: 335.0,
              height: 48.0,
              child: TextField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 415, width: 350,),
            MyProgressIndicator.myElevatedButton('Next',IntSecondScreen(),context),
          ]
      ),
    );
  }
}
