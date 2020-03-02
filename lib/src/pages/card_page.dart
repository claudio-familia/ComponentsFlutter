import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page Title')
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.directions_walk),
        onPressed: (){
          Navigator.pop(context);
        }
      ),
      body: ListView(
        padding: EdgeInsets.all(10.5),        
        children: <Widget>[
          _cardType1(), 
          _cardType2()        
        ]
      ),
    );
  }

  Card _cardType1() {     
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Soy el titulo de una tarjeta'),
            subtitle: Text('Soy un texto super larrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrggggggggggggggggggggggggggggggggggooooooooooooooooooooooooooooooooooooooooooooo'),
            leading: Icon(Icons.access_alarm),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: (){}, child: Text('Cancelar')),
              FlatButton(onPressed: (){}, child: Text('Ok')),
            ],
          )
        ],
      ),

    );
  }

  Card _cardType2(){
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('data/img/loading.gif'), 
            image: NetworkImage('https://images6.alphacoders.com/101/1015187.jpg'),
            fadeInDuration: Duration( milliseconds: 200 ),
          ),
          // Image(
          //   image: NetworkImage('https://images6.alphacoders.com/101/1015187.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('The Unseen Blade')
          )
        ],
      ),
    );
  }
}