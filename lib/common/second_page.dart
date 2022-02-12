// ignore_for_file: unnecessary_new

import 'package:app1/common/model.dart';
import 'package:app1/common/third_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({ Key? key }) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<WelcomePage> datalist =List<WelcomePage>.empty(growable: true);
  @override
  Widget build(BuildContext context) {

    
      
    return Scaffold(
       backgroundColor: Colors.yellow,  
      appBar: AppBar(
        title: const Text('listofusers'),
          
      ),
      body: (datalist.isEmpty)?
      const Center(
        child:Text('No Data Found'),
      )
      : ListView.builder(itemCount: datalist.length,itemBuilder: (context, index)=>detailsCard(datalist.elementAt(index))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final data= await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Form1()),
            );
            if(data!=null){
              WelcomePage wel= data as WelcomePage;
              print('data;$data');
              datalist.add(wel);
              setState( () {});
            }
        },
        child : const Icon(Icons.add),
         ),
        
    );
  }
}
Widget detailsCard(WelcomePage data){
  return Center(
    
      child: SizedBox(
        
        height:90,
        width:250,
         
        child: Card(  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(15.0),  
          ),  
          color: Colors.red,  
        elevation: 10,  
          child: Column(
            mainAxisSize: MainAxisSize.min,
            
            children: <Widget>[
              
            

             
        
        Text(data.name),
        
        Text(data.email),
        Text(data.phone),
        Text(data.dob),
     
     
        
    ],
  ),
        ),
      ),
  );
}
