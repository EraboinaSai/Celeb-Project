import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'custom_TextFormField.dart';
import './MyProgressIndicator.dart';
//import 'package:my_app/password.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen ({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen> {
  TextEditingController dateOfBirthController =  TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? dropdownValue;

  bool _isObscure = true;
  Map<String, String> fieldValues = {};
  setFieldValue(label, value) {
    fieldValues[label] = value;
  }
   myFirstScreenOnPressedButton(BuildContext context,myNextScreen){
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      fieldValues.forEach((label, value) => print('$label = $value'));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  myNextScreen),);

      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => SecondScreen(),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16.0,),
          onPressed: ()=>{Navigator.pop(context)},
          padding: EdgeInsets.only(left: 25, right: 8),),
        leadingWidth: 38,
        title: MyProgressIndicator.MyAppBarTitle(1,3),
        actions: <Widget>[
          MyProgressIndicator.MyAppBarSkipButton(),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: MyProgressIndicator(currentstep: 1, totalsteps: 3,),
        ),
      ),


      body: Form(
        key: _key,
        child: Column(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 32, 0, 22),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 24,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  )
              ),


             CustomTextFormField(
                 labelText: 'Name',

                 validator:(value) {
                                   if (value == null || value.trim().isEmpty) {
                                   return 'This field is required';
                                   }
                                    if (value.trim().length < 4) {
                                      return 'Username must be at least 4 characters in length';
                                     }
                                    return null;
                                    },
                                   onSaved: (value)=> fieldValues['Name'] = value!
                              ),



                CustomTextFormField(
                    labelText: 'Surname',
                    validator:(value) {if (value == null || value.trim().isEmpty) {
                      return 'This field is required';}
                                if (value.trim().length < 4) {
                      return 'Username must be at least 4 characters in length';
                    }
                    return null;
                    },
                    onSaved: (value)=>fieldValues['Surname'] = value!),



             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: DropdownButtonFormField(
                    value: dropdownValue,
                    icon: Container(
                      padding:  const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffeaf6f6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Image.asset("assets/Icons/Trailing Icon.png",),
                    ),
                    items: const [

                      DropdownMenuItem<String>(child: Text('Male'), value: 'Male'),
                      DropdownMenuItem<String>(child: Text('Female'), value: 'Female'),
                      DropdownMenuItem<String>(child: Text('Others'), value: 'Others'),
                    ],
                    hint: Text('Gender'),
                    decoration:const InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    validator: (value) {
                      if (dropdownValue == null)
                        return 'You must select Gender';
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        fieldValues['Drop Down'] = value.toString();
                      });
                    }),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: 345,
                  height: 48.0,
                  child: TextField(
                    controller: dateOfBirthController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date of Birth(dd.mm.yy)',
                    ),
                  ),
                ),
              ),


              CustomTextFormField(
                          labelText:'Enter the email',
                          validator:(value)
                         {
                           if (value == null || value.isEmpty)
                          return 'Field is required.';
                          String pattern = r'\w+@\w+\.\w+';
                          if (!RegExp(pattern).hasMatch(value))
                         return 'Invalid E-mail Address format.';
                         return null;
                       },
                  onSaved: (value) {
                setState(() {
              fieldValues['E-mail'] = value!;
           });
         }

              ),
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

          MyProgressIndicator.myElevatedButton( 'Next', SecondScreen(),context),

              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    fieldValues.forEach((label, value) => print('$label = $value'));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              )
            ]
         ),
       ),
     );
   }
  }
