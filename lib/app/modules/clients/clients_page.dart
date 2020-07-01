import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_page.dart';
import 'clients_controller.dart';
import 'widgets/custom_list_view.dart';

class ClientsPage extends StatefulWidget {
  final String title;
  const ClientsPage({Key key, this.title = "Clients"}) : super(key: key);

  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends ModularState<ClientsPage, ClientsController> {
  //use 'controller' variable to access controller

  TextEditingController controllerText = TextEditingController();

  @override
  void initState() {
    controllerText.text = null;
    super.initState();
  }

  static var maskTextInputFormatter = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 100,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: AppThemeLight().getTheme().primaryColor,
          onPressed: () {
            Modular.to.pushNamed('/newClient');
          },
          child: Text(
            'Novo Cliente',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Clientes'),
        centerTitle: true,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    inputFormatters: [maskTextInputFormatter],
                    controller: controllerText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              controller.clientStore
                                  .setSearch(controllerText.text);
                            }),
                        labelText: "Pesquisar cliente pelo CPF",
                        border: OutlineInputBorder()),
                  ),
                ),
                Observer(builder: (_) {
                  return Expanded(
                    child: SizedBox(
                      child: FutureBuilder(
                        future: controller.searchedUserByDoc(
                            controller.clientStore.searchDoc),
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
                                return Text('');
                              }
                              if (!snapshot.hasData) {
                                return Text('Nenhum Cliente Encontrado!');
                              } else {
                                return listView(snapshot.data);

                                // CustomListView(
                                //   clientSearched: snapshot.data,
                                // );
                              }
                              break;
                          }
                          return Container();
                        },
                      ),
                    ),
                  );
                }),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listView(List<ClientModel> clients) {
    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              'Nome : ' + clients[index].name,
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              'CPF : ' + clients[index].cpf,
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              "Endereço : " + clients[index].adress,
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              "Cidade/UF : " +
                                  clients[index].city +
                                  "/" +
                                  clients[index].state,
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: <Widget>[
                        Expanded(
                          child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 0.40,
                            child: RaisedButton(
                              onPressed: () {
                                //print('${widget.clientSearched[index].id}');
                                Modular.to.pushNamed(
                                    '/newRegister/${clients[index].id}');
                              },
                              child: Text(
                                'NOVO REGISTRO',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Color(0xff0D47A1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 0.40,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InfoClientPage(
                                          detailedClient: clients[index])),
                                );
                              },
                              child: Text(
                                'VER MAIS',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Color(0xff0D47A1),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
