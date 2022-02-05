import 'package:flutter/material.dart';
import 'model.dart';


class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);
  @override
  _FormState createState() => _FormState();
}
class _FormState extends State<Form1> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _date = TextEditingController();
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Name'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Email'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _date,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the date'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Phone No'
                ),
              ),
            ),
            ElevatedButton(onPressed: () async{
              Navigator.pop (context ,WelcomePage(name: _name.text, email: _email.text,date: _date.text, phone: _phone.text));
            }, child: const Text('submit'))
          ],
        ),
      ),
    );
  }
}
