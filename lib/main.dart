import 'package:flutter/material.dart';
import 'package:tupystock_app/login_screen.dart';
import 'package:tupystock_app/principal_comida_bebida.dart';
//import 'package:tupystock_app/cadastro_de_vendas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tupy Stock',
      //theme: ThemeData(primarySwatch: Colors.blueAccent[0xFF2979FF],),
      debugShowCheckedModeBanner: false,
      home: TelaBase(),
    );
  }
}


