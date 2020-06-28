import 'package:flutter/material.dart';

/*import 'package:flutter/widgets/home.dart';*/

class ListaBebidas extends StatefulWidget {
  @override
  _ListaBebidasState createState() => _ListaBebidasState();
}

class _ListaBebidasState extends State<ListaBebidas> {

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
                    const Text("Água"),
                    Image.asset(
                      'assets/agua.png',
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
                    const Text("Cerveja"),
                    Image.asset(
                      'assets/cerveja.png',
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
                    const Text("Coca-Cola"),
                    Image.asset(
                      'assets/coca.png',
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
            ],
          ),
        ),
      ],
    );
  }
}