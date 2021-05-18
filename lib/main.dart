import 'package:flutter/material.dart';
import 'package:portillo/route_generator.dart';

void main() => runApp(GabyApp());

class GabyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteo',
      initialRoute: "/",
      // home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }// fin de widget
}// fin de clase Gaby

class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
 
  PageOne({
    Key key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pagina 1 Gabriela Portillo'),
        
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Next page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.purple[300],
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  }// fin de widget 
 
  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
 
    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  }// _openSecondPage
}
