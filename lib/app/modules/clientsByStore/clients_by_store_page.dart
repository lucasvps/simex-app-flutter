import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/models/store_model.dart';
import 'package:simex_app/app/models/years_model.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_page.dart';
import 'package:simex_app/app/modules/newRegister/new_register_page.dart';
import 'clients_by_store_controller.dart';

class ClientsByStorePage extends StatefulWidget {
  final String title;
  const ClientsByStorePage({Key key, this.title = "ClientsByStore"})
      : super(key: key);

  @override
  _ClientsByStorePageState createState() => _ClientsByStorePageState();
}

class _ClientsByStorePageState
    extends ModularState<ClientsByStorePage, ClientsByStoreController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clientes por loja e ano de última compra'),
          centerTitle: false,
        ),
        body: Observer(builder: (context) {
          return Container(
            child: Column(
              //mainAxisAlignment: MainA,
              children: <Widget>[
                FutureBuilder(
                  future: controller.storeRepository.getAllStore(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                    onChanged: controller.store.setLastPurchaseYear,
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
                      future: (controller.store.lastPurchaseYear != null &&
                              controller.store.clientStore != null &&
                              controller.store.lastPurchaseYear.isNotEmpty &&
                              controller.store.lastPurchaseYear.length == 4)
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          controller.store.currentPage == '1'
                                              ? 'Nenhum cliente foi encontrado!'
                                              : "A lista de clientes acabou!",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Image.asset('lib/assets/images/empty.png',
                                          width:
                                              MediaQuery.of(context).size.width,
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
                              onPressed:
                                  (int.parse(controller.store.currentPage) > 1)
                                      ? () {
                                          controller.store.setCurrentPage(
                                              (int.parse(controller
                                                          .store.currentPage) -
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
                                          (int.parse(controller
                                                      .store.currentPage) +
                                                  1)
                                              .toString());
                                    }
                                  : null),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          );
        }));
  }

  // !-----------------------------------------------------------------------


  // ***********************************************************************************

  Widget dropDownMenu(List<StoreModel> stores) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
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
                      color: Colors.white,
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
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          FlutterPhoneDirectCaller.directCall(
                              clients[index].phone);
                        }),
                    Flexible(
                      child: Text(
                        'Ligar para ' + clients[index].name,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 14, 8),
                      child: InkWell(
                        onTap: () {
                          FlutterOpenWhatsapp.sendSingleMessage(
                              "+55" + clients[index].phone, "");
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.028,
                          width: MediaQuery.of(context).size.height * 0.028,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('lib/assets/images/wpp.jpg'),
                          )),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Enviar mensagem para ' + clients[index].name,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    )
                  ],
                ),
                Row(
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
