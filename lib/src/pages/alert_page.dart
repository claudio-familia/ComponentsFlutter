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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,        
          children: <Widget>[
            RaisedButton(
              onPressed: () => _showAlert(context),
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text('Click me!'),
              shape: StadiumBorder(),
            )
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
         title: Text('I\'m a card'),
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
         content: Column(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             Text('It looks like I am a text but I do not know why exactly I am here...'),
             FlutterLogo(size: 100,)
           ],           
         ), 
         actions: <Widget>[
           FlatButton(
             child: Text('Cancel'),
             onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
             child: Text('Ok'),
             onPressed: () => Navigator.of(context).pop(),
            ),
         ],
        );
      }
    );
  }
}