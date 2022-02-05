import '/WelcomePage.dart';

import 'package:flutter/material.dart';
class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);
  @override
  _FormState createState() => _FormState();
}
class _FormState extends State<Form1> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Name'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Email'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Phone No'
                ),
              ),
            ),
            ElevatedButton(onPressed: () async{
              Navigator.pop (context ,WelcomePage(name: _name.text, email: _email.text, phone: _phone.text));
            }, child: Text('submit'))
          ],
        ),
      ),
    );
  }
}
