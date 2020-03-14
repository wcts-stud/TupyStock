import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Teste do 0",
      home: Container(
        color: Colors.blueGrey,
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          color: Colors.greenAccent,
          child: Text("Teste"),
          constraints: BoxConstraints(
              maxHeight: 300.0,
              maxWidth: 200.0,
              minWidth: 150.0,
              minHeight: 150.0
          ),
        ),


      )

  ));
}