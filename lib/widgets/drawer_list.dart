import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea( //Faz com que a barra do sistema não altere o comportamento do drawer
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Gabriel Silva'),
              accountEmail: Text('gabs_pdc@hotmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.iconscout.com/icon/free/png-512/avatar-367-456319.png"), // AssetImage("assets/images/dog1.png")  => imagem dos assets
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritos'),
              subtitle: Text('Mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Clicou no Item 1');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              subtitle: Text('Mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Clicou no Item 2');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Clicou no Item 1');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
