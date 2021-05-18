import 'package:flutter/material.dart';
 
class SecondPage extends StatelessWidget {
  final String texto;
  TextEditingController _textController = TextEditingController();
 
  SecondPage({Key key, this.texto}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla 2 Gabriela Portillo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _textController,
                maxLength: 40,
                decoration: InputDecoration(
                  labelText: "Ingrese palabra",
                  hintText: "Palabra",
                ),
              ),
            ),
            MaterialButton(
              child: Text("Regresar"),
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ),
          ],
        ),// fin de columna hijo
      ),// fin de body center
    );//fin de scaffold
  }// fin de widgets
}//fin clase segunda pagina