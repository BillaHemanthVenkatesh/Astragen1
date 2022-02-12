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
        child: SizedBox(   
         child: Column(
           children:<Widget> [
             
             
                 Container(
                   child: Image.asset('images/qwe.jpeg'),
                  padding: const EdgeInsets.all(0.0),
                  
               
                  width: 360.0,
                  height: 360.0,
                ), //Container
               //Pad
              
              
            
             Container(height: 50),
             ElevatedButton(
              child: const Text('Start'),
       
    
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
               ), 
                 ],
        ),
         
         ),
      ),
    );
  }
}