import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final _formKey = GlobalKey<FormState>();
var categories = ['Bebida', 'Comida'];
String dropdownValue = categories[0];


class BaseCadastroProduto extends StatefulWidget {
  @override
  _BasePageCadastroProduto createState() => _BasePageCadastroProduto();
}

class _BasePageCadastroProduto extends State<BaseCadastroProduto>
    with SingleTickerProviderStateMixin {
  File _image;
  ScrollController _scrollViewController;
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {'description': null, 'value': null, 'category' : null, 'image' : null};



  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      formData['image'] = image;
    });
  }

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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Informe um valor';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Descrição do Produto',
                          ),
                          onSaved: (String value) {
                            formData['description'] = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 15),
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Informe um valor';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Valor Unitário',
                            ),
                            onSaved: (String value) {
                              formData['value'] = value;
                            },
                            keyboardType: TextInputType.numberWithOptions()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 55, left: 15),
                        child: DropdownButtonFormField<String>(
                          value: dropdownValue,
                          items:  categories.map((String v) {
                            return new DropdownMenuItem<String>(
                              child: SizedBox(
                                width: 250,
                                child: new Text(
                                  v,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              value: v,
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              print("Valor do Dropdown: $dropdownValue");
                              formData['category'] = dropdownValue;
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
                              )),
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
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 15),
              child: Text('Adicione uma imagem para o produto:'),
            ),
              Padding(
                padding: EdgeInsets.only( bottom: 5),
                child: _image == null
                    ?
                  Text('No image selected.')
                    : Image.file(_image),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 55, left: 15),
                child: FloatingActionButton(
                  onPressed: getImage,
                  tooltip: 'Pick Image',
                  child: Icon(Icons.add_a_photo),
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

                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save(); //onSaved is called!
                          print(formData);
                        }
                        print('Cadastrado');
                      },
                      child: new Text('Cadastrar',
                          style: new TextStyle(color: Colors.white)),
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
