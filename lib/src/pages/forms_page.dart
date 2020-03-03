import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {  
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  String _name = ""; 
  String _email = ""; 
  String _password = "";
  String _date = "";
  String _country = "Republica Dominicana";
  
  List<String> _countryList = ["Republica Dominicana", "Haiti", "Cuba", "Puerto Rico", "Jamaica"];  

  TextEditingController _dateFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('Forms'),
         ),
         body: ListView(
           children: <Widget>[
             Container(
               child: Center(
                         child: Text('Enter form', style: TextStyle(fontSize: 25))
                      ), 
                padding: EdgeInsets.only(top:15.2),
            ),
             Divider(),
             _getTextField(),
             Divider(),
             _getTextEmail(),
             Divider(),
             _getTextPassword(),
             Divider(),
             _getTextDateSelector(context),
             Divider(),
             _getDropDownCountries(),
             Divider(),
             ListTile(
               title: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text('Name: $_name'),
                   Text('Email: $_email'),
                   Text('Password: ${'*'*(_password.length)}'),
                   Text('Birthday: $_date'),                   
                 ],
               ),
               trailing: Text('$_country'),
             )
           ],
        ),
       ),
    );
  }

  _getTextField() {
    return Container(
      padding: EdgeInsets.only(left: 5.5, right: 5.5, top: 25),
      child: TextField(      
        textCapitalization: TextCapitalization.sentences,      
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)          
          ),
          counter: Text('Letters ${_name.length}'),
          hintText: 'Type your name',
          labelText: 'Name',
          suffixIcon: Icon(Icons.android),
          icon: Icon(Icons.account_circle)
        ),
        onChanged: (value){
          setState(() {
            _name = value;  
          });        
        },
      ),
    );
  }

  _getTextEmail() {
     return Container(
      padding: EdgeInsets.only(left: 5.5, right: 5.5, top: 25),
      child: TextField(  
        keyboardType: TextInputType.emailAddress,    
        textCapitalization: TextCapitalization.sentences,      
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)          
          ),          
          hintText: 'Type your email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)
        ),
        onChanged: (value){
          setState(() {
            _email = value;  
          });        
        },
      ),
    );
  }

  _getTextPassword() {
     return Container(
      padding: EdgeInsets.only(left: 5.5, right: 5.5, top: 25),
      child: TextField( 
        obscureText: true,            
        textCapitalization: TextCapitalization.sentences,      
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)          
          ),          
          hintText: 'Type your password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock_outline)
        ),
        onChanged: (value){
          setState(() {
            _password = value;  
          });        
        },
      ),
    );
  }

  _getTextDateSelector(BuildContext context) {
     return Container(
      padding: EdgeInsets.only(left: 5.5, right: 5.5, top: 25),
      child: TextField(   
        controller: _dateFieldController,                         
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)          
          ),          
          hintText: 'Type your birthdate',
          labelText: 'Birthdate',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)
        ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(1990), 
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')
    );

    if(picked != null){
      setState(() {
       _date = picked.toString();
       _dateFieldController.text = _date;
      });
    }
  }

 _getDropDownCountries(){
   List<DropdownMenuItem> _options = new List();

   _countryList.forEach((country){
     _options.add(DropdownMenuItem(
       child: Text(country),
       value: country,
     ));
   });

   return DropdownButton(
     items: _options,
     value: _country,     
     onChanged: (item){   
       setState(() {
         _country = item;
       });   
      print(item);
     },
   );
 }
}