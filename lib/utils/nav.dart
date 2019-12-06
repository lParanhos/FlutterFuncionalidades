import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page){
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
    return page;
  }));
}


void pop(BuildContext context,String text){
  Navigator.pop(context , text);
}
