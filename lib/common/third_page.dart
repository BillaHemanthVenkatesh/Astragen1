// ignore_for_file: unnecessary_const, deprecated_member_use, curly_braces_in_flow_control_structures, prefer_is_empty, prefer_const_constructors, prefer_final_fields, dead_code, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model.dart';
import 'package:app1/util/constants.dart';

class Form1 extends StatefulWidget {
  final WelcomePage? getdata;

  const Form1({Key? key, this.getdata}) : super(key: key);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form1> {
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _time = TextEditingController();
  DateTime currentDate = DateTime.now();

  GlobalKey<FormState> _key = new GlobalKey();

  bool _autoValidate = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  void initState() {
    if (widget.getdata != null) {
      _name = TextEditingController(text: widget.getdata?.name);
      _email = TextEditingController(text: widget.getdata?.email);
      _dob = TextEditingController(text: widget.getdata?.dob);
      _phone = TextEditingController(text: widget.getdata?.phone);
      _time = TextEditingController(text: widget.getdata?.time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text('Add the details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cera Pro',
            )),
      ),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: _validateName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name.',
                  icon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _email,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: _validateEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email.',
                  icon: const Icon(Icons.mail),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: _validatePhone,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter your phone number.',
                  icon: const Icon(Icons.person),
                ),
                maxLength: constants.maxlen,
              ),
              TextFormField(
                controller: _time,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'time',
                  hintText: 'Enter the time.',
                  icon: IconButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          initialEntryMode: TimePickerEntryMode.dial,
                        );
                        if (timeOfDay != null && timeOfDay != selectedTime) {
                          setState(() {
                            selectedTime = timeOfDay;
                            _time.text ="${selectedTime.hour}:${selectedTime.minute}";
                          });
                        }
                      },
                      icon: const Icon(Icons.schedule)),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _dob,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'dob',
                  hintText: 'Enter the dob.',
                  icon: IconButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2050));
                        if (pickedDate != null && pickedDate != currentDate)
                          setState(() {
                            DateTime formattedDate = pickedDate;
                            _dob.text =
                                "${formattedDate.day}-${formattedDate.month}-${formattedDate.year}";
                          });
                      },
                      icon: const Icon(Icons.calendar_today),
                ),
              ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    // color: Colors.blue,
                    child: const Text('Submit',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0)),
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        Navigator.pop(
                            context,
                            WelcomePage(
                                name: _name.text,
                                email: _email.text,
                                phone: _phone.text,
                                dob: _dob.text,
                                time: _time.text));
                      } else if (_validatePhone(_phone.text) != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('phone no error')),
                        );
                      } else if (_validateEmail(_email.text) != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('email error')),
                        );
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

  String? _validateName(String? value) {
    if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      //allow upper and lower case alphabets and space
      return "Enter Correct Name";
    } else {
      return null;
    }
  }

  String? _validatePhone(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.isEmpty || !RegExp(r'^(?:[+0][1-9])?[0-9]{10}$').hasMatch(value))
      return ' ';
    else {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return " ";
    }
    return null;
  }
}
