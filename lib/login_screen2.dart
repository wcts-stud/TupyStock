import 'package:flutter/material.dart';

// https://medium.com/jlouage/container-de5b0d3ad184


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        color: Colors.greenAccent,
        constraints: BoxConstraints(
            maxHeight: 300.0,
            maxWidth: 200.0,
            minWidth: 150.0,
            minHeight: 150.0
        ),
      ),


    );
  }
}
