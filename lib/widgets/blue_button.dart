// parâmetros dentro de colchetes '{}', são opcionais (a não ser q estejam marcados com @required)
// todos os parâmetros dentro de colchetes '{}' devem ser passados onde o construtor do objeto está sendo chamado precedido de 'nomedoargumento:'; exemplo: onPressed: função(...)
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  final String texto;
  final Function onPressed;
  final Color color;
  
  BlueButton(this.texto, {@required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
      color: color,
    );
  }
}