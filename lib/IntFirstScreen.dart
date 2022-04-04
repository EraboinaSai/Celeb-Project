import 'package:flutter/material.dart';
import './MyProgressIndicator.dart';
import 'IntSecondScreen.dart';
import 'custom_TextFormField.dart';
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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16.0,),
          onPressed: () => {Navigator.pop(context)},
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


            CustomTextFormField(
                labelText:'Enter the email',
                validator:(value) {
                  if (value == null || value.isEmpty)
                    return 'Field is required.';
                  String pattern = r'\w+@\w+\.\w+';
                  if (!RegExp(pattern).hasMatch(value))
                    return 'Invalid E-mail Address format.';
                  return null;
                },
                onSaved: (value) => fieldValues['E-mail'] = value!),

            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.only(left: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0),
                    ),

                    labelText:  'Password',
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
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Field is required.';
                    String pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    if (!RegExp(pattern).hasMatch(value))
                      return
                        '''
                        must be at least 8 characters,
                        include an uppercase letter, number and symbol.''';
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      fieldValues['Password'] = value!;
                    });
                  }
              ),
            ),

            SizedBox(height: 370, width: 350,),
            MyProgressIndicator.myElevatedButton('Next',IntSecondScreen(),context),
          ]
      ),
    );
  }
}
