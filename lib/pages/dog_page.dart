import 'package:flutter/material.dart';
import 'package:flutter_app/pages/hello_listview.dart';

class DogPage extends StatelessWidget {

  final Dog dog;

  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
        centerTitle: true,
      ),
      body: Image.asset(dog.img),
    );
  }
}
