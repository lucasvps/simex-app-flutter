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
          title: 'Clientes',
          subtitle: 'Buscar ou registrar novo cliente.',
          pageTo: '/clients'),
      customListTile(
          title: 'Contatos Hoje',
          subtitle: 'Contatos que devem ser feitos hoje.',
          pageTo: '/contacts'),
      customListTile(
          title: 'Registros',
          subtitle: 'Todos os registros feitos.',
          pageTo: '/login'),
      customListTile(
          title: 'Produtos/Campanha',
          subtitle: 'Ver e adicionar produtos/campanhas.',
          pageTo: '/login'),
    ]));
  }

  Widget customListTile({String title, String subtitle, String pageTo}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Modular.to.pushNamed(pageTo);
      },
    );
  }
}
