import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simex_app/app/app_controller.dart';
import 'package:simex_app/app/core/stores/auth_store.dart';
import 'package:simex_app/app/core/widgets.dart/custom_drawer.dart';
import 'package:simex_app/app/models/contacts_done_model.dart';
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
  SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      Modular.get<AuthStore>()
          .setUserEmail(sharedPreferences.getString('userEmail'));
      Modular.get<AuthStore>()
          .setUserName(sharedPreferences.getString('userName'));
      Modular.get<AuthStore>().setIsAdmin(sharedPreferences.getInt('is_admin'));
    } else {
      Modular.to.pushReplacementNamed('/login');
    }
  }

  @override
  void initState() {
    Modular.get<AppController>().currentUser().then((value) {
      id = value['id'];
    });
    checkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: SafeArea(child: CustomDrawer()),
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Modular.get<AppController>().authStore.logout();
                    },
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    )),
              ],
              bottom: TabBar(tabs: [
                Tab(
                  child: Text(
                    'Contatos a fazer hoje',
                    style: GoogleFonts.yanoneKaffeesatz(
                      fontSize: 18,
                    ),
                  ),
                  icon: Icon(Icons.contact_phone),
                ),
                Tab(
                  child: Text(
                    'Contatos realizados hoje',
                    style: GoogleFonts.yanoneKaffeesatz(
                      fontSize: 18,
                    ),
                  ),
                  icon: Icon(Icons.contacts),
                ),
              ]),
              title: Text(
                "NOME DO APLICATIVO AQUI",
                style: GoogleFonts.montserrat(),
              ),
              centerTitle: true,
            ),
            body: Container(
              child: TabBarView(
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
                            return SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Você nao tem contatos pra serem feitos hoje!',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Image.asset('lib/assets/images/empty.png',
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.65),
                                  ],
                                ),
                              ),
                            );
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
                                        'Você nao tem contatos pra serem feitos hoje!',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Image.asset('lib/assets/images/empty.png',
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.65),
                                  ],
                                ),
                              ),
                            );
                          }

                          return listViewTodo(snapshot.data);
                          break;
                      }
                      return Container();
                    },
                  ),
                  FutureBuilder(
                    future: controller.contactsDoneToday(),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Você não realizou contatos hoje!',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Center(
                                      child: Image.asset(
                                          'lib/assets/images/empty.png',
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.65)),
                                ],
                              ),
                            );
                          }

                          if (snapshot.data.length == 0) {
                            return Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Você não realizou contatos hoje!',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Center(
                                        child: Image.asset(
                                            'lib/assets/images/empty.png',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.65)),
                                  ],
                                ),
                              ),
                            );
                          }

                          return listViewDone(snapshot.data);
                          break;
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            )));
  }

  Widget listViewTodo(List<NextContactsModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: Colors.black,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              color: Colors.white,
              child: ListTile(
                trailing: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RegisterInfoPage(contactsModel: list[index])),
                    );
                  },
                  child: Text(
                    'VISUALIZAR\nREGISTRO',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xff0D47A1),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nome : ' + list[index].name,
                      style: GoogleFonts.pangolin(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Telefone : ' + list[index].phone,
                      style: GoogleFonts.pangolin(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: list[index].productId != null
                          ? Text(
                              "Produto : " + list[index].productName,
                              style: GoogleFonts.pangolin(
                                fontSize: 18,
                              ),
                            )
                          : list[index].observation != null
                              ? Text(
                                  "Descrição do Contato : " +
                                      list[index].observation,
                                  style: GoogleFonts.pangolin(
                                    fontSize: 18,
                                  ),
                                )
                              : SizedBox(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      list[index].productId != null
                          ? "Valor :" +
                              NumberFormat.simpleCurrency(locale: 'pt_Br')
                                  .format(
                                double.parse(list[index].price),
                              )
                          : "",
                      style: GoogleFonts.pangolin(
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                      child: Text(
                        (formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd])
                                    .toString() !=
                                list[index].nextContact
                            ? "Contato Atrasado"
                            : ""),
                        style: TextStyle(
                            backgroundColor: Colors.red, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget listViewDone(List<ContactsDoneModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        print(list[index].status);
        return Padding(
            padding: list[index].status == 'Contato'
                ? EdgeInsets.all(0)
                : EdgeInsets.all(8.0),
            child: list[index].status == 'Contato'
                ? null
                : Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Cliente : ' + list[index].name,
                                  style: GoogleFonts.pangolin(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Status : ' + list[index].status,
                                  style: GoogleFonts.pangolin(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              list[index].status == "Venda Perdida"
                                  ? Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        'Razão : ' + list[index].reason,
                                        style: GoogleFonts.pangolin(
                                          fontSize: 18,
                                        ),
                                      ),
                                    )
                                  : list[index].status == "Venda Pendente"
                                      ? Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            list[index].observation != null
                                                ? 'Observação : ' +
                                                    list[index].observation
                                                : "Nenhuma observação!",
                                            style: GoogleFonts.pangolin(
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            'Valor de Venda : ' +
                                                NumberFormat.simpleCurrency(
                                                        locale: 'pt_Br')
                                                    .format(
                                                  double.parse(
                                                      list[index].valueSold),
                                                ),
                                            style: GoogleFonts.pangolin(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                            ],
                          ),
                        ),
                        Container(
                            child: list[index].status == "Venda Efetiva"
                                ? Icon(
                                    Icons.check_circle_outline,
                                    size: 80,
                                  )
                                : list[index].status == 'Venda Pendente'
                                    ? Icon(
                                        Icons.remove_circle_outline,
                                        size: 80,
                                        color: Colors.orange,
                                      )
                                    : Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 80,
                                      )),
                      ],
                    )));
      },
    );
  }
}
