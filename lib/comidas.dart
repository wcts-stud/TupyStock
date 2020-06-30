import 'package:flutter/material.dart';

class ListaComida extends StatefulWidget {
  @override
  _ListaComidaState createState() => _ListaComidaState();
}

class _ListaComidaState extends State<ListaComida> {
  int _value1 = 0;
  int _value2 = 0;
  int _value3 = 0;

  //Função 1
  void _add1() {
    setState(() {
      _value1++;
    });
  }

  void _subtract1() {
    setState(() {
      _value1--;
    });
  }

  //Função 2
  void _add2() {
    setState(() {
      _value2++;
    });
  }

  void _subtract2() {
    setState(() {
      _value2--;
    });
  }

  //Função 3
  void _add3() {
    setState(() {
      _value3++;
    });
  }

  void _subtract3() {
    setState(() {
      _value3--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 0,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[

              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0.0),
                width: 500.0,
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    const Text("Coxinha"),
                    Image.asset(
                      'assets/coxinha.png',
                      width: 100,
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.add), onPressed: _add1),
                    new Text('${_value1}'),
                    new IconButton(
                        icon: new Icon(Icons.remove), onPressed: _subtract1),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0.0),
                width: 500.0,
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    const Text("Pão de queijo"),
                    Image.asset(
                      'assets/pao-de-queijo.png',
                      width: 100,
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8),

                child: Row(

                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.add), onPressed: _add2),
                    new Text('${_value2}'),
                    new IconButton(
                        icon: new Icon(Icons.remove), onPressed: _subtract2),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0.0),
                width: 500.0,
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    const Text("Pastel"),
                    Image.asset(
                      'assets/pastel.png',
                      width: 100,
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8),

                child: Row(

                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.add), onPressed: _add3),
                    new Text('${_value3}'),
                    new IconButton(icon: new Icon(Icons.remove), onPressed: _subtract3),
                  ],
                ),
              ),


              Center(
                child: new ButtonBar(
                  mainAxisSize: MainAxisSize.min, // this will take space as minimum as posible(to center),
                  buttonPadding: EdgeInsets.all(15),
                  buttonMinWidth: 150,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text('Criar produto', style: new TextStyle(color: Colors.white)),
                      onPressed: () { print('Criar produto'); },
                      shape: new RoundedRectangleBorder(borderRadius:
                      new BorderRadius.circular(20.0)),
                      color: Colors.green,

                    ),
                  ],
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

        ),

      ],
    );
  }
}


