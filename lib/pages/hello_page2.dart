import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        centerTitle: true ,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton("Voltar",
        onPressed: () => onClickBack(context),
      )
    );
  }

  onClickBack(context) {
    //O segundo parametro, é um dado do tipo string que eu passo para quem chamou essa tela
    pop(context , "Tela 2");
  }
}
