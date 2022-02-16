import 'package:flutter/material.dart';

class WelcomePage {
   String name,email,phone,dob;
  String time;
  String gender;
 
   WelcomePage({ required this.name, required this.email,required this.phone,required this.dob,required this.time,required this.gender}) ;
}
class Tech
{
  String label;
  Color color;
  bool isSelected;
  Tech(this.label, this.color, this.isSelected);
}