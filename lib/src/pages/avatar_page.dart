import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar here')
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