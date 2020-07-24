import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/registers_done_model.dart';
import 'registers_done_controller.dart';

class RegistersDonePage extends StatefulWidget {
  final String title;
  const RegistersDonePage({Key key, this.title = "RegistersDone"})
      : super(key: key);

  @override
  _RegistersDonePageState createState() => _RegistersDonePageState();
}

class _RegistersDonePageState
    extends ModularState<RegistersDonePage, RegistersDoneController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.store.registerRepository.lastPageRegistersDone().then((value) {
      controller.store.setLastPage(value.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Seu histórico de registros feitos',
            style: GoogleFonts.montserrat(),
          ),
          centerTitle: true,
        ),
        body: Observer(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: FutureBuilder(
                    future: controller.store.registerRepository
                        .registersDoneByUser(controller.store.currentPage),
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
                            return Center(
                                child: Text(
                                    'Ocorreu um erro, recarregue a página!'));
                          }
                          if (!snapshot.hasData) {
                            return Center(
                                child: Text(
                              'Você não possui registros anteriores!',
                              style: TextStyle(fontSize: 20),
                            ));
                          } else {
                            if (snapshot.data.toString() == '[]') {
                              return Center(
                                  child: Text(
                                'Você não possui registros anteriores!',
                                style: TextStyle(fontSize: 20),
                              ));
                            }
                            return customList(snapshot.data);
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
                      onPressed: (int.parse(controller.store.currentPage) > 1)
                          ? () {
                              controller.store.setCurrentPage(
                                  (int.parse(controller.store.currentPage) - 1)
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
                                  (int.parse(controller.store.currentPage) + 1)
                                      .toString());
                            }
                          : null),
                ],
              )
            ],
          );
        }));
  }

  Widget customList(List<RegistersDone> registers) {
    return ListView.builder(
        itemCount: registers.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: ListTile(
              trailing: registers[index].status == "Venda Efetiva"
                  ? Icon(
                      Icons.check_circle_outline,
                      size: 35,
                      color: AppThemeLight().getTheme().primaryColor,
                    )
                  : registers[index].status == 'Venda Pendente'
                      ? Icon(
                          Icons.remove_circle_outline,
                          size: 35,
                          color: Colors.orange,
                        )
                      : Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 35,
                        ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Cliente : ' + registers[index].name,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Status : ' + registers[index].status,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Data de Contato : ' +
                        formatDate(
                            DateFormat("yyyy-MM-dd").parse(
                              registers[index].dateContact,
                            ),
                            [dd, '/', mm, '/', yyyy]).toString(),
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
