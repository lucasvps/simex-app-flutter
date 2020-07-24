import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/contacts_done_model.dart';
import 'package:simex_app/app/models/user_model.dart';
import 'contacts_by_user_controller.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class ContactsByUserPage extends StatefulWidget {
  final String title;
  const ContactsByUserPage({Key key, this.title = "ContactsByUser"})
      : super(key: key);

  @override
  _ContactsByUserPageState createState() => _ContactsByUserPageState();
}

class _ContactsByUserPageState
    extends ModularState<ContactsByUserPage, ContactsByUserController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos de cada vendedor'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return SizedBox(
          child: Column(
            children: <Widget>[
              Container(
                  child: FutureBuilder(
                future: controller.store.repository.getUsers(),
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
                      } else {
                        return Center(
                          child: dropDownMenu(snapshot.data),
                        );
                      }
                      break;
                  }
                  return Container();
                },
              )),
              Expanded(
                child: SizedBox(
                  child: FutureBuilder(
                    future: (controller.store.initialDateChoice != null &&
                            controller.store.userId != null)
                        ? controller.store.repository
                            .contactsDoneByUserSpecificDay(
                                id: controller.store.userId,
                                initialDate: controller.store.initialDateChoice,
                                finalDate: controller.store.finalDateChoice)
                        : null,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case ConnectionState.none:
                          return Text("");
                          break;
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          if (!snapshot.hasData) {
                            return Text("No data");
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
                                        'Este vendedor não realizou e não possui contatos para estas datas!',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Center(
                                        child: Image.asset(
                                      'lib/assets/images/empty.png',
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.65,
                                    )),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: listViewDone(snapshot.data),
                            );
                          }
                          break;
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // ***********************************************************************************

  Widget dropDownMenu(List<UserModel> users) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: double.maxFinite,
          //width: MediaQuery.of(context).size.width * 0.5,
          child: Card(
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
                      items: users.map((item) {
                        return DropdownMenuItem(
                          child: Center(
                            child: Text(
                              item.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          value: item.id.toString(),
                        );
                      }).toList(),
                      hint: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                          child: Text("Vendedores",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Indie')),
                        ),
                      ),
                      onChanged: (_) async {
                        controller.store.setUserId(_);
                      },
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      value: controller.store.userId,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RaisedButton(
                        child: Text('Escolher dia',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        color: AppThemeLight().getTheme().primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        onPressed: () {
                          _selectRangeDate(context);
                        },
                      ),
                    ),
                    Flexible(
                      child: Center(
                        child: Text(
                          controller.store.initialDateChoiceBR != null
                              ? "${controller.store.initialDateChoiceBR} à ${controller.store.finalDateChoiceBR}"
                              : "",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<Null> _selectRangeDate(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: new DateTime.now(),
        initialLastDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (picked != null) {
      controller.store.setInitialDateChoiceBR(
          formatDate(picked[0], [dd, '/', mm, '/', yyyy]));
      controller.store.setFinalDateChoiceBR(
          formatDate(picked[1], [dd, '/', mm, '/', yyyy]));
      controller.store.setInitialDateChoice(
          formatDate(picked[0], [yyyy, '-', mm, '-', dd]));
      controller.store
          .setFinalDateChoice(formatDate(picked[1], [yyyy, '-', mm, '-', dd]));
    }
  }

  Widget listViewDone(List<ContactsDoneModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
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
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Tipo de Contato : ' + list[index].contactFrom,
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
                              : list[index].status == "Venda Pendente" || list[index].status == "Contato"
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
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "Date de contato : " +
                                  formatDate(
                                      DateFormat("yyyy-MM-dd").parse(
                                        list[index].dateContact,
                                      ),
                                      [dd, '/', mm, '/', yyyy]).toString(),
                              style: GoogleFonts.pangolin(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                                list[index].nextContact != null
                                    ? "Próximo contato : " +
                                        formatDate(
                                            DateFormat("yyyy-MM-dd").parse(
                                              list[index].nextContact,
                                            ),
                                            [dd, '/', mm, '/', yyyy]).toString()
                                    : "",
                                style: GoogleFonts.pangolin(
                                    fontSize: 18,
                                    backgroundColor: list[index].nextContact !=
                                            null
                                        ? list[index].nextContact ==
                                                formatDate(DateTime.now(),
                                                    [yyyy, '-', mm, '-', dd])
                                            ? Colors.blue
                                            : (DateTime.parse(
                                                        list[index].nextContact)
                                                    .isBefore(DateTime.now()))
                                                ? Colors.red
                                                : Colors.blue
                                        : Colors.transparent)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                                  : list[index].status == "Venda Perdida"
                                      ? Icon(
                                          Icons.close,
                                          color: Colors.red,
                                          size: 80,
                                        )
                                      : Icon(Icons.chat,
                                          color: Colors.blue, size: 80)),
                    ),
                  ],
                )));
      },
    );
  }
}
