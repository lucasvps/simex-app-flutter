import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/app_controller.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      FutureBuilder(
        future: Modular.get<AppController>().authStore.getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.none:
              return Text('erro 1');
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                Modular.to.pushNamedAndRemoveUntil(
                    '/login', ModalRoute.withName('/home'));
                //Modular.get<AppController>().authStore.refresh();
              }
              if (!snapshot.hasData) {
                Modular.to.pushNamedAndRemoveUntil(
                    '/login', ModalRoute.withName('/home'));
                //Modular.get<AppController>().authStore.refresh();
              } else {
                return UserAccountsDrawerHeader(
                  accountName: Text(snapshot.data['name']),
                  accountEmail: Text(snapshot.data['email']),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                );
              }

              break;
          }
          return Container();
        },
      ),
      customListTile(
          icon: Icons.people,
          title: 'Clientes',
          subtitle: 'Buscar ou registrar novo cliente.',
          pageTo: '/clients'),
      customListTile(
          icon: Icons.folder,
          title: 'Registros',
          subtitle: 'Todos os registros feitos.',
          pageTo: '/registersDone'),
      customListTile(
          icon: Icons.build,
          title: 'Produtos/Campanha',
          subtitle: 'Ver e adicionar produtos/campanhas.',
          pageTo: '/activesProduct'),
    ]));
  }

  Widget customListTile(
      {String title, String subtitle, String pageTo, IconData icon}) {
    return Card(
      color: Color(0xffFFF176).withOpacity(0.9),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Modular.to.pushNamed(pageTo);
        },
      ),
    );
  }
}
