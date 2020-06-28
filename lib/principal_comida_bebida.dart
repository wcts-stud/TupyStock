import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './bebidas.dart' as bebidas;
import './comidas.dart' as comidas;


class TelaBase extends StatefulWidget {
  @override
  _TelaBaseState createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
              expandedHeight: 170,
              backgroundColor: Colors.white,
              floating: true,
              forceElevated: boxIsScrolled,

              bottom: new TabBar(
                  controller: _tabController,
                  tabs: <Tab>[
                    new Tab(icon: new Icon(Icons.local_bar, color: Color.fromRGBO(87, 84, 244, 1),)),
                    new Tab(icon: new Icon(Icons.local_dining, color: Color.fromRGBO(87, 84, 244, 1),)),
                  ]),
              flexibleSpace: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 45, bottom: 80, right: 5),
                      child: Text(
                        'Cadastro da Venda',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(87, 84, 244, 1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 30, bottom: 80),
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
        body: TabBarView(
          children: <Widget>[
            bebidas.ListaBebidas(),
            comidas.ListaComida(),
          ],
          controller: _tabController,
        ),
      ),


    );
  }
}

