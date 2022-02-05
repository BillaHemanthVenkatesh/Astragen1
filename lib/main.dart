import 'package:app1/WelcomePage.dart';
import 'package:flutter/material.dart';
import '/Form.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

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
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  List<WelcomePage> datalist =List<WelcomePage>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('listofusers'),
      ),
      body: (datalist.isEmpty)?
      Center(
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
      Text(data.email),
      Text(data.phone),
      Divider(
              color: Colors.black
            )
      
    ],
  );
}