import 'package:flutter/material.dart';
import 'package:tupystock_app/login_screen.dart';
import 'package:tupystock_app/base_screen.dart';
import 'package:tupystock_app/base_resumo_vendas_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tupy Stock',
      theme: ThemeData(primarySwatch: Colors.blueAccent[0xFF2979FF],),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}


