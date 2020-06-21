import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:simex_app/app/app_controller.dart';
import 'package:simex_app/app/models/next_contacts_model.dart';
import 'package:simex_app/app/modules/registerInfo/registerInfo_page.dart';
import 'contatos_controller.dart';

class ContatosPage extends StatefulWidget {
  final String title;
  const ContatosPage({Key key, this.title = "Contatos"}) : super(key: key);

  @override
  _ContatosPageState createState() => _ContatosPageState();
}

class _ContatosPageState
    extends ModularState<ContatosPage, ContatosController> {
  //use 'controller' variable to access controller

  int id;

  @override
  void initState() {
    Modular.get<AppController>().currentUser().then((value) {
      id = value['id'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(
                  child: Text('Contatos a fazer hoje'),
                ),
                Tab(
                  child: Text('Contatos realizados'),
                ),
              ]),
              title: Text("Contatos de Hoje"),
              centerTitle: true,
            ),
            body: TabBarView(
              children: <Widget>[
                FutureBuilder(
                  future: controller.contactsToday(id),
                  builder: (context, snapshot) {
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
                          return Center(child: Text('Ocorreu um erro!'));
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text(
                                'Você nao tem contatos pra serem feitos hoje!'),
                          );
                        }

                        if (snapshot.data.length == 0) {
                          return Center(
                            child: Text(
                                'Você nao tem contatos pra serem feitos hoje!'),
                          );
                        }

                        return listView(snapshot.data);
                        break;
                    }
                  },
                ),
                Text('tab 2'),
              ],
            )));
  }

  Widget listView(List<NextContactsModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey[200],
              child: ListTile(
                trailing: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterInfoPage(contactsModel: list[index])),
                    );
                  },
                  child: Text(
                    'VER\nREGISTRO',
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.orange,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Nome : ' + list[index].name),
                    Text('Telefone : ' + list[index].phone),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Produto : " + list[index].productName),
                    Text("Valor : " + list[index].value.toString()),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
