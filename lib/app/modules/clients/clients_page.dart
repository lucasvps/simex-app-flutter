import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_page.dart';
import 'package:simex_app/app/modules/newRegister/new_register_page.dart';
import 'clients_controller.dart';

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
    controllerText.text = "";
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
          backgroundColor:
              AppThemeLight().getTheme().primaryColor.withOpacity(0.6),
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
        title: Text(
          'Clientes',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                child: TextFormField(
                  //inputFormatters: [maskTextInputFormatter],
                  controller: controllerText,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            //controller.clientStore.clientRepository.lastPageClientsByName("Alberto");
                            controller.clientStore
                                .setSearch(controllerText.text);
                            controller.clientStore.clientRepository
                                .lastPageClientsByName(controllerText.text);
                            controllerText.text = '';
                          }),
                      labelText: "Pesquisar cliente pelo nome",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)))),
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                child: FutureBuilder(
                  future: controller.searchUserByName(
                      controller.clientStore.searchDoc,
                      controller.clientStore.currentPage),
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
                        }
                        break;
                    }
                    return Container();
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (int.parse(controller.clientStore.currentPage) >
                            1)
                        ? () {
                            controller.clientStore.setCurrentPage(
                                (int.parse(controller.clientStore.currentPage) -
                                        1)
                                    .toString());
                          }
                        : null),
                Text(controller.clientStore.currentPage),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: controller.clientStore.currentPage !=
                            controller.clientStore.lastPage
                        ? () {
                            controller.clientStore.setCurrentPage(
                                (int.parse(controller.clientStore.currentPage) +
                                        1)
                                    .toString());
                          }
                        : null),
              ],
            )
          ],
        );
      }),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'NOME : ' + clients[index].name,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'CPF : ' + clients[index].cpf,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "ENDEREÇO : " + clients[index].adress,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Cidade/UF : " +
                        clients[index].city +
                        "/" +
                        clients[index].state,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 3,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewRegisterPage(
                                      clientModel: clients[index],
                                    )),
                          );
                        },
                        child: Text(
                          'NOVO REGISTRO',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                        color: Color(0xff0D47A1),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 3,
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
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                        color: Color(0xff0D47A1),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
