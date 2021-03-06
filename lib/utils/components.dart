import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes{

  static caixaDeTexto(String rotulo, String dica, TextEditingController controlador, validacao, {bool obscure=false, bool numero=false}){
    return TextFormField(
      controller: controlador,
      obscureText: obscure,
      validator: validacao,
      keyboardType: numero?TextInputType.number:TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 18),
        hintText: dica,
        hintStyle: TextStyle(fontSize: 10, color: Colors.red),
      ),
    );

  }

  static botao(IconData _icon, Function _f) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(_icon),
            color: Colors.blue,
            iconSize: 60,
            onPressed: _f,
          ),
        ),
      ),
    );
  }
}