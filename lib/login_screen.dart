import 'package:flutter/material.dart';

// https://medium.com/jlouage/container-de5b0d3ad184

var seller = ['Alberto', 'Carlos', 'Fábio', 'João'];

String dropdownValue = seller[0];



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(40),
        child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


          new Image(image: AssetImage('assets/images/logo_tupy.gif'),),


          new DropdownButtonFormField<String>(
            value: dropdownValue,
            items: seller.map((String v) {
              return new DropdownMenuItem<String>(
                child: SizedBox(
                  width: 305,
                  child: new Text(v, textAlign: TextAlign.center,),
                ),
                value: v,
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                print("Valor do Dropdown: $dropdownValue");
              });
            },

            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              wordSpacing: 2,
            ),

            decoration: InputDecoration(
              alignLabelWithHint: true,
                labelText: "Vendedor",
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )
            ),
          ),


          new Padding(
            padding: EdgeInsets.only(top: 20),
            child: new TextFormField(
              autofocus: true,
              style: TextStyle( color: Colors.black ),
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.black)
              ),
            ),
          ),




        ],
      )


      )



    );

  }
}
