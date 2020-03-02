import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final counter = ['First Gate', 
                   'Second Gate', 
                   'Third Gate', 
                   'Fourth Gate', 
                   'Fifth Gate'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Components Temp'),          
        ),
        body: ListView(
          children: _setItemMeta(),
        ),
      ),
    );
  }

  // List<Widget> _setItems(){

  //   List<Widget> counterList = new List<Widget>();

  //   for(String count in counter){
  //       var object = ListTile(
  //         title: Text(count),
  //       );

  //       counterList..add(object)
  //                  ..add(Divider());
  //   }
    
  //   return counterList;
  // }

  List<Widget> _setItemMeta(){    
    return counter.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('I\'m a subtitle'),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}