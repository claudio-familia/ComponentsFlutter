import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {  

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(      
            borderRadius: _borderRadius,
            color: _color,            
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeDesignMethod(),
        child: Icon(Icons.movie_filter),
      ),
    );
  }

  _changeDesignMethod() {
    setState(() {
      _width = Random().nextDouble() * Random().nextInt(900);
      _height = Random().nextDouble() * Random().nextInt(900);
      _color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
      _borderRadius = BorderRadius.only(bottomLeft: Radius.circular(Random().nextDouble() * 100), topRight: Radius.circular(Random().nextDouble() * 100));

      print('Witdh: $_width, Height: $_height, Color: $_color, Borde $_borderRadius'); 
    });
  }
}