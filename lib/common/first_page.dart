import 'package:app1/common/second_page.dart';
import 'package:flutter/material.dart';


class Firstpage extends StatefulWidget {
  const Firstpage({ Key? key }) : super(key: key);

  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    
      
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFisrtpage'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          },
        ),
      ),
    );
  }
}