import 'package:flutter/material.dart';

class BasePageVendas extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePageVendas>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 100,
              backgroundColor: Colors.white,
              floating: true,
              forceElevated: boxIsScrolled,
              flexibleSpace: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 45, bottom: 10, right: 5),
                      child: Text(
                        'Resumo da venda',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(87, 84, 244, 1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 40, left: 20, right: 30, bottom: 10),
                    child: FittedBox(
                      fit: BoxFit.contain, // otherwise the logo will be tiny
                      child: Image.asset(
                        'assets/tupy-schroeder-sc.gif',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Adicionar os Widget necessarios para a contrução do corpo da tela
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  'Resumo de venda',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),

              Center(
                  child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Produto',
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Quantidade',
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Preço',
                        ),
                      ),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Coca')),
                          DataCell(Text('1')),
                          DataCell(Text('R\$10')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Coxinha')),
                          DataCell(Text('2')),
                          DataCell(Text('R\$12')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('')),
                          DataCell(Text('Total')),
                          DataCell(Text('R\$22')),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Recebido',
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Troco',
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('R\$30')),
                              DataCell(Text('R\$8')),
                            ],
                          ),
                        ],
                      ),
                    ))
              ])),

              Center(
                child: new ButtonBar(
                  mainAxisSize: MainAxisSize
                      .min, // this will take space as minimum as posible(to center),
                  buttonPadding: EdgeInsets.all(15),
                  buttonMinWidth: 150,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text('Voltar',
                          style: new TextStyle(color: Colors.white)),
                      onPressed: () {
                        print('Voltar');
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      color: Colors.redAccent,
                    ),
                    new RaisedButton(
                      child: new Text('Novo Pedido',
                          style: new TextStyle(color: Colors.white)),
                      onPressed: () {
                        print('Novo Pedido');
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
