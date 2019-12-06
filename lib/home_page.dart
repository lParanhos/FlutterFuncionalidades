import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/pages/hello_listview.dart';
import 'package:flutter_app/pages/hello_page2.dart';
import 'package:flutter_app/pages/hello_page3.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widgets/blue_button.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: "Tab 1",),
            Tab(text: "Tab 2",),
            Tab(text: "Tab 3",)
          ]),
        ),
        body: TabBarView(children: [
          _body(context),
          Container(color: Colors.green,),
          Container(color: Colors.yellow,),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(context) {
    return Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_text(), _pageView(), _buttons()],
        ));
  }

  _pageView() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast)
              ],
            )
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    //Pego o retorno das telas, que podem ser em qualquer tipo
    //Lembrando que é do tipo future, então preciso usar async e await
    String retornoDaTelaChamada = await push(context, page);

    print(">> $retornoDaTelaChamada");
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(label: "Ok", onPressed: () => print("Ok")),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          //WillPopScope usado para impedir que, no caso do android, o modal seja fechado com o botão de voltar
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter é muito legal"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK !!!");
                  },
                  child: Text("Ok"),
                ),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito legal",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
