import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar here'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage('https://steamuserimages-a.akamaihd.net/ugc/788605969330362331/BFBB7BDBA476FBB7B3B686FE10333E4E468071D6/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true'),
            radius: 30.0,
          ),
          Container(
            margin: EdgeInsets.only(right:10.0, left: 3.0),
            child: CircleAvatar(
              child: Text('CF'),
              backgroundColor: Colors.grey,
            ),
          ) 
        ],
      ),
      body: FadeInImage(
        placeholder: AssetImage('data/img/loading.gif'),
        image: NetworkImage('https://cdna.artstation.com/p/assets/images/images/010/994/890/4k/noah-thatcher-zed-3-5.jpg?1527310600'),
        fadeInDuration: Duration(milliseconds: 200),
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