import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import './MyProgressIndicator.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen ({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen> {
  TextEditingController dateOfBirthController =  TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Map<String, String> fieldValues = {};
  String? dropdownValue ;
  setFieldValue(label, value) {
    fieldValues[label] = value;
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 24,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    )
                ),
                TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Field is required.';
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        fieldValues['Name'] = value!;
                      });
                    }),


                MyProgressIndicator.buildSizedBox(),
                TextFormField(
                    decoration:const InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      border: OutlineInputBorder(),
                      labelText: 'Surname',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Field is required.';
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        fieldValues['Surname'] = value!;
                      });
                    }),
                MyProgressIndicator.buildSizedBox(),


                DropdownButtonFormField(
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
                      if (dropdownValue == '')
                        return 'You must select Gender';
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        fieldValues['Drop Down'] = value.toString();
                      });
                    }),


                MyProgressIndicator.buildSizedBox(),
                Container(
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
                MyProgressIndicator.buildSizedBox(),
                TextFormField(
                    decoration:const InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                     border: OutlineInputBorder(),
                      labelText:  'Enter the email',
                    ),
                    validator: (value) {
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
                    }),
                MyProgressIndicator.buildSizedBox(),

                TextFormField(
                  //obscureText: true,
                    decoration:const InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.0),
                      ),
                      labelText:  'Password',
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
                    }),



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
      ),
    );
  }
}