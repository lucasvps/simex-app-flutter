import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/core/widgets.dart/custom_drawer.dart';
import '../../app_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(child: CustomDrawer()),
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Modular.get<AppController>().authStore.logout();
            },
            child: Text('Sair'),
          )
        ],
        title: Text('Nome do aplicativo'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: RaisedButton(
            onPressed: () {
              Modular.get<AppController>().currentUser();
            },
            child: Text('bota'),
          ))
        ],
      ),
    );
  }
}
