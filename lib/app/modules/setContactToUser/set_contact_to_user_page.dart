import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/models/store_model.dart';
import 'package:simex_app/app/models/user_model.dart';
import 'set_contact_to_user_controller.dart';

class SetContactToUserPage extends StatefulWidget {
  final String title;
  const SetContactToUserPage({Key key, this.title = "SetContactToUser"})
      : super(key: key);

  @override
  _SetContactToUserPageState createState() => _SetContactToUserPageState();
}

class _SetContactToUserPageState
    extends ModularState<SetContactToUserPage, SetContactToUserController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                child: Text(
                  'Clientes',
                  style: GoogleFonts.yanoneKaffeesatz(
                    fontSize: 18,
                  ),
                ),
                icon: Icon(Icons.people),
              ),
              Tab(
                  child: Text(
                    'Dia e Vendedor',
                    style: GoogleFonts.yanoneKaffeesatz(
                      fontSize: 18,
                    ),
                  ),
                  icon: Icon(
                    Icons.calendar_today,
                  )),
            ]),
            title: Text(widget.title),
          ),
          body: Observer(builder: (context) {
            return Container(
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: controller.storeRepository.getAllStore(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.active:
                            case ConnectionState.waiting:
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                              break;
                            case ConnectionState.none:
                              return Text("No connection has been made");
                              break;
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              if (!snapshot.hasData) {
                                return Text("No data");
                              }

                              return Center(
                                child: SingleChildScrollView(
                                    child: dropDownMenu(snapshot.data)),
                              );

                              break;
                          }
                          return Container();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          onChanged: (value) {
                            controller.store.setLastPurchaseYear(value);
                            // controller.store.setListToNull(
                            //     controller.store.idClientsSelected);
                            // controller.store
                            //     .setListToNull(controller.store.clients);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              labelText: "Ano de última compra do cliente"),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          child: FutureBuilder(
                            future: (controller.store.lastPurchaseYear !=
                                        null &&
                                    controller.store.clientStore != null &&
                                    controller
                                        .store.lastPurchaseYear.isNotEmpty &&
                                    controller.store.lastPurchaseYear.length ==
                                        4)
                                ? controller.store.repository
                                    .searchUsersByStoreAndYear(
                                        store: controller.store.clientStore,
                                        year: controller.store.lastPurchaseYear,
                                        page: controller.store.currentPage)
                                : null,
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.active:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                  break;
                                case ConnectionState.none:
                                  return Text('');
                                  break;
                                case ConnectionState.done:
                                  if (snapshot.hasError) {
                                    return Text('');
                                  }
                                  if (!snapshot.hasData) {
                                    return Text('Nenhum Cliente Encontrado!');
                                  }
                                  if (snapshot.data.length == 0) {
                                    return SingleChildScrollView(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                controller.store.currentPage ==
                                                        '1'
                                                    ? 'Nenhum cliente foi encontrado!'
                                                    : "A lista de clientes acabou!",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Image.asset(
                                                'lib/assets/images/empty.png',
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.65),
                                          ],
                                        ),
                                      ),
                                    );
                                  }

                                  return listView(snapshot.data);

                                  break;
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                      (controller.store.clientStore != null &&
                              controller.store.lastPurchaseYear != null &&
                              controller.store.lastPurchaseYear.isNotEmpty &&
                              controller.store.lastPurchaseYear.length == 4)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.arrow_back_ios),
                                    onPressed: (int.parse(
                                                controller.store.currentPage) >
                                            1)
                                        ? () {
                                            controller.store.setCurrentPage(
                                                (int.parse(controller.store
                                                            .currentPage) -
                                                        1)
                                                    .toString());
                                          }
                                        : null),
                                Text(controller.store.currentPage),
                                IconButton(
                                    icon: Icon(Icons.arrow_forward_ios),
                                    onPressed: controller.store.currentPage !=
                                                controller.store.lastPage &&
                                            controller.store.lastPage != '1'
                                        ? () {
                                            controller.store.setCurrentPage(
                                                (int.parse(controller.store
                                                            .currentPage) +
                                                        1)
                                                    .toString());
                                          }
                                        : null),
                              ],
                            )
                          : SizedBox()
                    ],
                  ),
                  Observer(builder: (context) {
                    return Column(
                      children: <Widget>[
                        Container(
                            child: FutureBuilder(
                          future: controller.store.userRepository.getUsers(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.active:
                              case ConnectionState.waiting:
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                                break;
                              case ConnectionState.none:
                                return Text("No connection has been made");
                                break;
                              case ConnectionState.done:
                                if (snapshot.hasError) {
                                  return Text(snapshot.error.toString());
                                }
                                if (!snapshot.hasData) {
                                  return Text("No data");
                                } else {
                                  return Center(
                                    child: dropDownMenuUsers(snapshot.data),
                                  );
                                }
                                break;
                            }
                            return Container();
                          },
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              color: AppThemeLight().getTheme().primaryColor,
                              onPressed: () {
                                _selectDate(context);
                              },
                              child: Text(
                                'Marcar data para os contatos!',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                          child: Container(
                            width: double.maxFinite,
                            child: Card(
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.space,
                                  children: <Widget>[
                                    Text(
                                      controller.store.dateChoiceBR != null
                                          ? "Data de Contato : " +
                                              controller.store.dateChoiceBR
                                          : "",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      controller.store.userName != null
                                          ? "Vendedor : " +
                                              controller.store.userName
                                          : "",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                            child: Text(
                              "Clientes Selecionados",
                              style: TextStyle(fontSize: 20),
                            ),
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                                itemCount: controller.store.clients.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            'NOME : ' +
                                                controller
                                                    .store.clients[index].name,
                                            style: GoogleFonts.pangolin(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            'CIDADE/UF : ' +
                                                controller
                                                    .store.clients[index].city +
                                                '/' +
                                                controller
                                                    .store.clients[index].state,
                                            style: GoogleFonts.pangolin(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            'LOJA : ' +
                                                controller
                                                    .store.clients[index].store,
                                            style: GoogleFonts.pangolin(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                color: AppThemeLight().getTheme().primaryColor,
                                onPressed: controller.store.userId != null &&
                                        controller.store.dateChoice != null &&
                                        controller
                                            .store.idClientsSelected.isNotEmpty
                                    ? () {
                                        controller.store.createAllRegisters(
                                            controller.store.idClientsSelected);
                                      }
                                    : null,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                child: Text(
                                  "Finalizar",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                ],
              ),
            );
          })),
    );
  }

  // ***********************************************************************************

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //locale: Locale('pt'),
        firstDate: DateTime.now().subtract(Duration(days: 1)),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (picked != null) {
      var brDate = formatDate(picked, [dd, '/', mm, '/', yyyy]);
      var usDate = formatDate(picked, [yyyy, '/', mm, '/', dd]);
      controller.store.setDateChoice(usDate);
      controller.store.setDateChoiceBR(brDate);
    }
  }

  // ***********************************************************************************

  Widget dropDownMenu(List<StoreModel> stores) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          borderOnForeground: true,
          elevation: 5,
          color: AppThemeLight().getTheme().primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isDense: false,
                    dropdownColor: AppThemeLight().getTheme().primaryColor,
                    items: stores.map((item) {
                      return DropdownMenuItem(
                        child: Text(
                          item.storeName,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        value: item.storeName.toString(),
                      );
                    }).toList(),
                    hint: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Center(
                        child: Text("Loja",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Indie')),
                      ),
                    ),
                    onChanged: (_) async {
                      controller.store.setClientStore(_);
                    },
                    icon: Icon(
                      Icons.arrow_downward,
                      size: 20,
                      color: Colors.black,
                    ),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    value: controller.store.clientStore,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  // ! ------------------------------------

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
                    "TELEFONE : " + clients[index].phone,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    clients[index].lastPurchase != null
                        ? "Data de última compra : " +
                            formatDate(
                                DateFormat("yyyy-MM-dd").parse(
                                  clients[index].lastPurchase,
                                ),
                                [dd, '/', mm, '/', yyyy]).toString()
                        : "",
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Checkbox(
                    value: controller.store.idClientsSelected
                        .contains(clients[index].id),
                    onChanged: (v) {
                      setState(() {
                        controller.store.addToList(clients[index]);
                        controller.store.addToListId(clients[index].id);
                      });
                    })
              ],
            ),
          ),
        );
      },
    );
  }

  // ***********************************************************************************

  Widget dropDownMenuUsers(List<UserModel> users) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.maxFinite,
          //width: MediaQuery.of(context).size.width * 0.5,
          child: Card(
            elevation: 5,
            color: AppThemeLight().getTheme().primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      dropdownColor: AppThemeLight().getTheme().primaryColor,
                      items: users.map((item) {
                        return DropdownMenuItem(
                          child: Center(
                            child: Text(
                              item.name,
                              //textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          value: item.id.toString(),
                        );
                      }).toList(),
                      hint: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                          child: Text("Vendedores ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Indie')),
                        ),
                      ),
                      onChanged: (_) async {
                        controller.store.setUserId(_);
                        controller.store.userRepository
                            .getAnyUserInfo(id: _)
                            .then((value) {
                          controller.store.setUserName(value['name']);
                        });
                      },
                      icon: Icon(
                        Icons.arrow_downward,
                        size: 20,
                        color: Colors.white,
                      ),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      value: controller.store.userId,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
