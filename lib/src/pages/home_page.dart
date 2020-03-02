import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';

import 'package:components/src/utils/icons_utils.dart';
 
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter components'),
      ),
      body: _getListView(),
    );
  }

  Widget _getListView() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){        
        return ListView(
          children: _getListItems(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _getListItems(BuildContext context, List<dynamic> data) {
    
    final List<Widget> options = new List<Widget>();

    data.forEach((opt){      
      final item = ListTile(
       title: Text(opt['texto']),
       leading: getIconFromString(opt['icon'], Colors.blueAccent),       
       onTap: (){
         Navigator.pushNamed(context, opt['ruta']);

        //  final route = MaterialPageRoute(
        //    builder: (context){
        //      return AlertPage();
        //    }
        //   );
        //  Navigator.push(context, route);
       },       
      );

      options..add(item)
             ..add(Divider());
    });

    return options;
  }
}