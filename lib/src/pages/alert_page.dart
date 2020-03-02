import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertPage here')
      ),
      floatingActionButton: FloatingActionButton(        
        onPressed: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.directions_walk),
      ),
    );
  }
}