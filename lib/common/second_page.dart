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
  return Column (
    mainAxisSize:MainAxisSize.min, 
    children: [

      
      Text(data.name),
      Text(data.age),
      Text(data.bio),
      const Divider(
              color: Colors.black
            )
      
    ],
  );
}