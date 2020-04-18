import 'package:flutter/material.dart';


final _formKey = GlobalKey<FormState>();
var categories = ['Bebida', 'Comida'];
String dropdownValue = categories[0];

class BaseCadastroProduto extends StatefulWidget {
  @override
  _BasePageCadastroProduto createState() => _BasePageCadastroProduto();
}

class _BasePageCadastroProduto extends State<BaseCadastroProduto>
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
                        'Cadastro de Produto',
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
                padding:
                    EdgeInsets.only(top: 40, bottom: 5, left: 30, right: 30),
                child: Text(
                  'Informe os dados abaixo para realizar o cadastro do produto',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 40, bottom: 20, left: 30, right: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 15, left: 15, right: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Descrição do Produto',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 15),
                        child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Valor Unitário',
                            ),
                            keyboardType: TextInputType.numberWithOptions()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 55, left: 15),
                        child: DropdownButtonFormField<String>(
                          value: dropdownValue,
                          items: categories.map((String v) {
                            return new DropdownMenuItem<String>(
                              child: SizedBox(
                                width: 305,
                                child: new Text(v, textAlign: TextAlign.center,),
                              ),
                              value: v,
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              print("Valor do Dropdown: $dropdownValue");
                            });
                          },

                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            wordSpacing: 2,
                          ),

                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              labelText: "Categoria do Produto",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                              )
                          ),
                        ),
                      ),
// BOTÃO PADRÃO DO FORM PARA O SUBMIT, VERIFICAR SE É NECESSÁRIO OU NÃO
//                      Padding(
//                        padding: const EdgeInsets.symmetric(vertical: 16.0),
//                        child: RaisedButton(
//                          onPressed: () {
//                            // Validate will return true if the form is valid, or false if
//                            // the form is invalid.
//                            if (_formKey.currentState.validate()) {
//                              // Process data.
//                            }
//                          },
//                          child: Text('Submit'),
//                        ),
//                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: new ButtonBar(
                  mainAxisSize: MainAxisSize
                      .min, // this will take space as minimum as posible(to center),
                  buttonPadding: EdgeInsets.all(15),
                  buttonMinWidth: 150,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text('Cancelar',
                          style: new TextStyle(color: Colors.white)),
                      onPressed: () {
                        print('Cancelado');
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      color: Colors.redAccent,
                    ),
                    new RaisedButton(
                      child: new Text('Cadastrar',
                          style: new TextStyle(color: Colors.white)),
                      onPressed: () {
                        print('Cadastrado');
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
