import 'package:calculadora_app/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController controllerNumero1 = TextEditingController();
  TextEditingController controllerNumero2 = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String info = "Resultado:";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: criaPaginaPrincipal(),
    );
  }

  criaPaginaPrincipal() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora", style: TextStyle(color: Colors.black), textScaleFactor: 1.5,),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              color: Colors.red,
              onPressed: resetaCampos)
        ],
      ),
      body: criaFormularioCalculadora(),
    );
  }

  criaFormularioCalculadora() {
    return Form(
      key: cForm,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Componentes.caixaDeTexto("Número 1", "Número 1", controllerNumero1, null, numero: true),
            Componentes.caixaDeTexto("Número 2", "Número 2", controllerNumero2, null, numero: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Componentes.botao(CupertinoIcons.plus, soma),
              Componentes.botao(CupertinoIcons.minus, subtracao),
              Componentes.botao(CupertinoIcons.multiply, multiplicacao),
              Componentes.botao(CupertinoIcons.divide, divisao),
            ],
          ),
            Text(
              info,
              style: TextStyle(fontSize: 40, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  Function validaNumero= ((value){
    if(value.isEmpty){
      return "Informe um número";
    }
    return null;
  });

  resetaCampos(){
    controllerNumero1.text="";
    controllerNumero2.text="";
    setState(() {
      info = "Resultado:";
      cForm = GlobalKey<FormState>();
    });
  }

  soma(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double n1 = double.parse(controllerNumero1.text);
      double n2 = double.parse(controllerNumero2.text);
      double result = n1 + n2;
      info = result.toString();
    });
  }

  subtracao(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double n1 = double.parse(controllerNumero1.text);
      double n2 = double.parse(controllerNumero2.text);
      double result = n1 - n2;
      info = result.toString();
    });
  }

  multiplicacao(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double n1 = double.parse(controllerNumero1.text);
      double n2 = double.parse(controllerNumero2.text);
      double result = n1 * n2;
      info = result.toString();
    });
  }

  divisao(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double n1 = double.parse(controllerNumero1.text);
      double n2 = double.parse(controllerNumero2.text);
      double result = n1 / n2;
      info = result.toString();
    });
  }

}
