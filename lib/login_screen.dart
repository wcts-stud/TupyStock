import 'package:flutter/material.dart';
import 'package:tupystock_app/bebidas_screen.dart';
import 'package:tupystock_app/services/authentication.dart';

// https://medium.com/jlouage/container-de5b0d3ad184

var seller = ['Alberto', 'Carlos', 'Fábio', 'João'];

String dropdownValue = seller[0];

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //redimensiona screen focando em campos específicos
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.only(top: 15, left: 40, right: 40),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: Image(
                    image: AssetImage('assets/images/logo_tupy.gif'),
                    //centerSlice:  Rect.fromLTRB(0,0,0,0)
                  ),
                ),

                //new Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 200)),

                new Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue,
                    items: seller.map((String v) {
                      return new DropdownMenuItem<String>(
                        child: SizedBox(
                          width: 150,
                          child: new Text(
                            v,
                            textAlign: TextAlign.end,
                          ),
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
                      fontSize: 20,
                      wordSpacing: 3,
                    ),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Vendedor",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),
                ),



                new Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: new TextFormField(
                    autofocus: true,
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.black, fontSize: 20, letterSpacing: 2),
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 0)),
                  ),
                ),

                Center(
                  child: new ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      // this will take space as minimum as posible(to center),
                      buttonPadding: EdgeInsets.all(15),
                      buttonMinWidth: 200,
                      buttonHeight: 55,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 40),
                          child: RaisedButton(
                            child: new Text('Entrar',
                                style: new TextStyle(color: Colors.white)),
                            onPressed: () {
                              Services().authHttpJson();

                              /*Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => ListaBebidas()));
                               */
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
                            color: Color.fromRGBO(32, 20, 252, 0.75),
                          ),
                        ),
                      ]),
                )
              ],
            )));
  }
}
