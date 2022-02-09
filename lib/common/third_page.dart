// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'model.dart';


class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);
  @override
  _FormState createState() => _FormState();

  void onSubmit(TextEditingController name) {}
}
class _FormState extends State<Form1> {
  

  TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  
  GlobalKey<FormState> _key = new GlobalKey();

  bool _autoValidate = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title:  const Text('Add the details', 
        style: TextStyle(
          color: Colors.white, 
          fontSize: 24.0, 
          fontWeight: FontWeight.w500, 
          fontFamily: 'Cera Pro', 
        )),
      ),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        // autovalidate: _autoValidate,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _name,
                validator: _validateName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name.'
                ),
              ),
              
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _age,
                validator: _validateAge,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  hintText: 'Enter your age.'
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _bio,
                validator: _validateBio,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  hintText: 'Enter your bio.'
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    // color: Colors.blue,
                    child: const Text('Save', style: const TextStyle(color: Colors.white, fontSize: 16.0)),
                    onPressed: () async{
                      if(_key.currentState!.validate()){
                      Navigator.pop (context ,WelcomePage(name: _name.text,age: _age.text,bio: _bio.text ));
                        
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


String? _validateName(String? value){
    if(value?.length == 0){
      return '*Required Field';
    } else if((value?.length ?? 0) < 3){
      return 'Name is too short';
    } else {
      return null;
    }
  }

  
  String? _validateAge(String? value){
    String pattern = r'(^[1-9 ]*$)';
    RegExp regExp = new RegExp(pattern);
    if(value?.length == 0){
      return '*Required Field';
    } else if(!regExp.hasMatch(value ?? "")) { 
      return 'Age should be numeric';
    } else {
      return null;
    }
  }

  String? _validateBio(String? value){
    if(value?.length == 0){
      return '*Required Field';
    } else if((value?.length ?? 0) < 20){ 
      return 'Bio should be more than 20 charectors';
    } else {
      return null;
    }
  }
}
 
