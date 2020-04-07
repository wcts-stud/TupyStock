import 'package:flutter/material.dart';

class ListaBebidas extends StatefulWidget {
  @override
  _ListaBebidasState createState() => _ListaBebidasState();
}

class _ListaBebidasState extends State<ListaBebidas> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: Icon(
              Icons.local_bar,
              color: Colors.blue,
              size: 200,
            ),
          ),
          Center(
            child: Icon(
              Icons.local_bar,
              color: Colors.red,
              size: 200,
            ),
          ),
          Center(
            child: Icon(
              Icons.local_bar,
              color: Colors.green,
              size: 200,
            ),
          ),
          Center(
            child: new ButtonBar(
              mainAxisSize: MainAxisSize.min, // this will take space as minimum as posible(to center),
              buttonPadding: EdgeInsets.all(15),
              buttonMinWidth: 150,
              children: <Widget>[
                new RaisedButton(
                  child: new Text('Cancelar', style: new TextStyle(color: Colors.white)),
                  onPressed: () { print('Cancelado'); },
                  shape: new RoundedRectangleBorder(borderRadius:
                  new BorderRadius.circular(20.0)),
                  color: Colors.redAccent,

                ),
                new RaisedButton(
                  child: new Text('Cadastrar', style: new TextStyle(color: Colors.white)),
                  onPressed: () { print('Cadastrado'); },
                  shape: new RoundedRectangleBorder(borderRadius:
                  new BorderRadius.circular(20.0)),
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),


    );
  }
}
