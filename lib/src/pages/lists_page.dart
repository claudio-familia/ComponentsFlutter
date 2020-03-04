import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {  

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> { 
  List<int> _numbers = [];
  int _lastItem = 0;

  String _option = "";
  bool _blur = false;
  bool _grayScale = false;
  double _blurCounter = 1.0;
  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() { 
    super.initState();
    _getPages();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fetchData();
      }
    });
  }

  @override
  void dispose() {    
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Stack(
        children: <Widget>[
          _getListBuilder(),
          _showLoading() 
        ],
      )
    );
  }

  _getListBuilder() {
    return RefreshIndicator(
      onRefresh: () => _refreshPage(),
      child: ListView.builder(
        itemCount: _numbers.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index){
          final _image = _numbers[index]; 
          final url = 'https://picsum.photos/id/$_image/500/300$_option';       
          return Column(
            children: <Widget>[
              _getSwitchTile(),
              _getSwitchBlur(),
              _getSlider(),
              FadeInImage(
                placeholder: AssetImage('data/img/loading.gif'), 
                image: NetworkImage(url)
              ),
            ],
          );
        }
      ),
    );
  }
   _getSwitchTile(){
    return SwitchListTile(
      title: Text('GrayScale'),
      value: _grayScale, 
      activeColor: Colors.blueAccent,
      onChanged: (checked){
        setState(() {
          _grayScale = checked;
          if(_blur){
            _option += checked ? "&grayscale":"";
          }else{
            _option = "";
            _option += checked ? "?grayscale":"";
          }                   
        });
      }
    );
  }

  _getSwitchBlur(){
    return SwitchListTile(
      title: Text('Blur'),
      value: _blur, 
      activeColor: Colors.blueAccent,
      onChanged: (checked){
        setState(() {
          _blur = checked;
          if(_grayScale){
            _option += checked ? "&blur=$_blurCounter":"";
          }else{
            _option = "";
            _option += checked ? "?blur=$_blurCounter":"";
          }
        });
      }
    );
  }

  _getSlider() {
    return Slider(
      value: _blurCounter,
      label: 'Valor del blur',
      activeColor: Colors.redAccent,
      min:1.0,
      max: 10.0, 
      onChanged: !_blur ? null : (val){
        setState(() {
          _blurCounter = val;          
        });
      }
    );
  }

  _getPages(){
    for (var i = 1; i <= 10; i++) {      
      _lastItem++;
      _numbers.add(_lastItem);
    }
    setState(() { });
    print(_numbers);
  }

  _fetchData(){
    _isLoading = true;
    setState(() { });

    final duration = new Duration(seconds: 2);
    return new Timer(duration, requestHTTP);
  }

  void requestHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels +100,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn
    );
    _getPages();    
  }

  _showLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }else{
      return Container();
    }
  }

  Future<void> _refreshPage() async {
    final duration = new Duration(seconds:2);
    new Timer(duration, (){
      _numbers.clear();
      _lastItem++;
      _getPages();
    });

    return Future.delayed(duration);
  }
}