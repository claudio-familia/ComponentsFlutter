import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 250.0;
  bool _lockSlider = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),   
      ),
      body: Container(
        padding: EdgeInsets.all(10.2),
        child: Column(
          children: <Widget>[          
            _getSlider(),
            Text('Divine Dancer Zed', style: TextStyle(fontSize: 25),),
            _getCheckBox(),
            _getCheckListTle(),
            _getSwitchTle(),
            Expanded(
              child: _getImage()
            )            
          ],
        ),
      ),
    );
  }

  _getSlider() {
    return Slider(
      value: _sliderValue,
      label: 'Tamaño de la imagen',
      activeColor: Colors.redAccent,
      min:50.0,
      max: 400.0, 
      onChanged: _lockSlider ? null : (val){
        setState(() {
          _sliderValue = val;
          print(val);
        });
      }
    );
  }

  _getImage(){
    return FadeInImage(
      placeholder: AssetImage('data/img/loading.gif'),
      image: NetworkImage('https://cdnb.artstation.com/p/assets/images/images/013/477/209/large/grant-jacobs-kda-zed.jpg?1539775025'),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }

  _getCheckBox(){
    return Checkbox(
      value: _lockSlider, 
      activeColor: Colors.blueAccent,
      onChanged: (checked){
        setState(() {
          _lockSlider = checked;
        });
      }
    );
  }

   _getCheckListTle(){
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _lockSlider, 
      activeColor: Colors.blueAccent,
      onChanged: (checked){
        setState(() {
          _lockSlider = checked;
        });
      }
    );
  }

   _getSwitchTle(){
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _lockSlider, 
      activeColor: Colors.blueAccent,
      onChanged: (checked){
        setState(() {
          _lockSlider = checked;
        });
      }
    );
  }


}