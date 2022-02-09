import 'package:flutter/material.dart';
import 'model.dart';


class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);
  @override
  _FormState createState() => _FormState();

  void onSubmit(TextEditingController name) {}
}
class _FormState extends State<Form1> {
  
final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  void _submit() {
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      // on success, notify the parent widget
      widget.onSubmit(_name);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter your name',
            ),
            // use the validator to return an error string (or null) based on the input text
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Can\'t be empty';
              }
              if (text.length < 4) {
                return 'Too short';
              }
              
              return null;
            },
            // update the state variable when the text changes
            onChanged: (text) => setState(() => _name = text as TextEditingController),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Email',
                    icon: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _date,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the date',
                    icon: Icon(Icons.date_range),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Phone No',
                    icon: Icon(Icons.phone),
                ),
              ),
            ),
            ElevatedButton(onPressed: () async{
              _name.isNotEmpty ? _submit : null;
              Navigator.pop (context ,WelcomePage(name: _name.text, email: _email.text,date: _date.text, phone: _phone.text));
            
            },
            child: const Text('submit'))
          ],
        ),
      ),
    );
  }

  
}
 
