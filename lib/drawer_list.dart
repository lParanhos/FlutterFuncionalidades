import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Leandro"),
                accountEmail: Text("leandro-paranhos@hotmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://www.urbanarts.com.br/imagens/produtos/018255/Detalhes/stormtrooper-black-power.jpg"),
                ),
            ),

            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações ..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Flutter");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações ..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Flutter");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              subtitle: Text("mais informações ..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Flutter");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
