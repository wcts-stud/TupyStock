import 'dart:io';

import 'package:flutter/material.dart';

// https://medium.com/jlouage/container-de5b0d3ad184

String dropdownValue = "asasf";

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


          new Image(image: AssetImage('assets/images/logo_tupy.gif'),),




          new DropdownButtonFormField<String>(
            items: <String>['Alberto', 'Carlos', 'Fábio', 'João'].map((String v) {
              return new DropdownMenuItem<String>(
                value: v,
                child: new Text(v),
              );
            }).toList(),
            onChanged: (_) {},

            decoration: InputDecoration(
                labelText: "Qual seu nome?",
                labelStyle: TextStyle(

                )
            ),

            style:
                
            TextStyle(color: Colors.black),
          )
        ],
      )


      )



    );

  }
}
