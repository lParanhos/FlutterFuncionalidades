import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  String text;
  Function onPressed;
  Color color;

  /* Quando usamos a seguinte sintaxe
  * {this.onPressed}
  * Forçamos o usuário a escrever onPressed, quando for passar esse parametro,
  * e o @required faz com que seja um parametro obrigatório, deixa bem parecido com o Button do flutter
  *
  * Como no JS no caso da cor, colocamos a cor azul como default
  * */

  BlueButton(this.text, {@required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );;
  }
}
