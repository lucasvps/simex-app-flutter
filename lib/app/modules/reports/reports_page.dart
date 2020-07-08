import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/user_model.dart';
import 'reports_controller.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class ReportsPage extends StatefulWidget {
  final String title;
  const ReportsPage({Key key, this.title = "Reports"}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends ModularState<ReportsPage, ReportsController> {
  //use 'controller' variable to access controller

  String choice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios'),
        centerTitle: false,
        actions: <Widget>[
          Observer(builder: (context) {
            return FlatButton(
                onPressed: () {
                  Modular.to.pushNamedAndRemoveUntil(
                      '/pdfCreate/${controller.store.choice}',
                      ModalRoute.withName('/pdfCreate'));
                },
                child: ((controller.store.clientsWithoutContact &&
                                controller.pdfStore.daysContactsURL != null &&
                                controller.pdfStore.daysContactsURL != '0' &&
                                controller.pdfStore.daysContactsURL != "") |
                            (controller.store.clientsWithoutPurchase &&
                                controller.pdfStore.daysPurchaseURL != null &&
                                controller.pdfStore.daysPurchaseURL != '0' &&
                                controller.pdfStore.daysPurchaseURL != "") ||
                        (controller.store.clientsThatSpentMore) ||
                        (controller.store.productEficiency &&
                            controller.pdfStore.initialDateProductBR != null &&
                            controller.pdfStore.finalDateProductBR != null) ||
                        (controller.store.enterpriseReport &&
                            controller.pdfStore.initialDateEnterprise != null &&
                            controller.pdfStore.finalDateEnterprise != null) ||
                        (controller.store.userReport &&
                            controller.pdfStore.finalDateUser != null &&
                            controller.pdfStore.initialDateUser != null &&
                            controller.pdfStore.idUser != null))
                    ? Text(
                        'Gerar Relatório',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            backgroundColor: Colors.grey.withOpacity(0.4)),
                      )
                    : SizedBox());
          })
        ],
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Card(
                    color: AppThemeLight().getTheme().primaryColor,
                    elevation: 20,
                    shape: RoundedRectangleBorder(),
                    child: Center(
                        child: Text('ESCOLHA QUAL O RELATÓRIO QUE DESEJA',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: controller.store.clientsWithoutContact,
                        onChanged: (value) {
                          controller.store.setChoice('1');
                          controller.store.setClientsWithoutContact();
                          controller.store.clientsWithoutPurchase = false;
                          controller.store.clientsThatSpentMore = false;
                          controller.store.enterpriseReport = false;
                          controller.store.productEficiency = false;
                          controller.store.userReport = false;

                          controller.pdfStore.setInitialDateProduct(null);
                          controller.pdfStore.setfinalDateProduct(null);
                          controller.pdfStore.setInitialDateProductBR(null);
                          controller.pdfStore.setfinalDateProductBR(null);

                          controller.pdfStore.setInitialDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterprise(null);
                          controller.pdfStore.setInitialDateEnterprise(null);

                          controller.pdfStore.setInitialDateUserBR(null);
                          controller.pdfStore.setfinalDateUserBR(null);
                          controller.pdfStore.setfinalDateUser(null);
                          controller.pdfStore.setInitialDateUser(null);
                          controller.pdfStore.setUserID(null);
                        },
                        checkColor: AppThemeLight().getTheme().primaryColor,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Lista de clientes sem contato a mais de NNN dias',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: controller.store.clientsWithoutContact
                        ? TextFormField(
                            initialValue:
                                controller.pdfStore.daysContactsURL != '0'
                                    ? controller.pdfStore.daysContactsURL
                                    : "",
                            onChanged: controller.pdfStore.setDaysContactsURL,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Dias",
                              border: OutlineInputBorder(),
                            ),
                          )
                        : SizedBox(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ! ------------------------------
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: controller.store.clientsWithoutPurchase,
                        onChanged: (value) {
                          controller.store.setChoice('2');
                          controller.store.setClientsWithoutPurchase();
                          controller.store.clientsWithoutContact = false;
                          controller.store.clientsThatSpentMore = false;
                          controller.store.enterpriseReport = false;
                          controller.store.productEficiency = false;
                          controller.store.userReport = false;

                          controller.pdfStore.setInitialDateProduct(null);
                          controller.pdfStore.setfinalDateProduct(null);
                          controller.pdfStore.setInitialDateProductBR(null);
                          controller.pdfStore.setfinalDateProductBR(null);

                          controller.pdfStore.setInitialDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterprise(null);
                          controller.pdfStore.setInitialDateEnterprise(null);

                          controller.pdfStore.setInitialDateUserBR(null);
                          controller.pdfStore.setfinalDateUserBR(null);
                          controller.pdfStore.setfinalDateUser(null);
                          controller.pdfStore.setInitialDateUser(null);
                          controller.pdfStore.setUserID(null);
                        },
                        checkColor: AppThemeLight().getTheme().primaryColor,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Lista de clientes sem compra a mais de NNN dias',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: controller.store.clientsWithoutPurchase
                        ? TextFormField(
                            initialValue:
                                controller.pdfStore.daysPurchaseURL != '0'
                                    ? controller.pdfStore.daysPurchaseURL
                                    : "",
                            onChanged: controller.pdfStore.setDaysPurchaseURL,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Dias",
                              border: OutlineInputBorder(),
                            ),
                          )
                        : SizedBox(),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // ! ------------------------------
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: controller.store.clientsThatSpentMore,
                        onChanged: (value) {
                          controller.store.setChoice('3');
                          controller.store.setClientsThatSpentMore();
                          controller.store.clientsWithoutContact = false;
                          controller.store.clientsWithoutPurchase = false;
                          controller.store.enterpriseReport = false;
                          controller.store.productEficiency = false;
                          controller.store.userReport = false;

                          controller.pdfStore.setInitialDateProduct(null);
                          controller.pdfStore.setfinalDateProduct(null);
                          controller.pdfStore.setInitialDateProductBR(null);
                          controller.pdfStore.setfinalDateProductBR(null);

                          controller.pdfStore.setInitialDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterprise(null);
                          controller.pdfStore.setInitialDateEnterprise(null);

                          controller.pdfStore.setInitialDateUserBR(null);
                          controller.pdfStore.setfinalDateUserBR(null);
                          controller.pdfStore.setfinalDateUser(null);
                          controller.pdfStore.setInitialDateUser(null);
                          controller.pdfStore.setUserID(null);
                        },
                        checkColor: AppThemeLight().getTheme().primaryColor,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Lista de clientes que mais gastaram',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // ! ------------------------------
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: controller.store.productEficiency,
                        onChanged: (value) {
                          controller.store.setChoice('4');
                          controller.store.setProductEficiency();
                          controller.store.clientsWithoutContact = false;
                          controller.store.clientsWithoutPurchase = false;
                          controller.store.clientsThatSpentMore = false;
                          controller.store.enterpriseReport = false;
                          controller.store.userReport = false;

                          controller.pdfStore.setInitialDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterprise(null);
                          controller.pdfStore.setInitialDateEnterprise(null);

                          controller.pdfStore.setInitialDateUserBR(null);
                          controller.pdfStore.setfinalDateUserBR(null);
                          controller.pdfStore.setfinalDateUser(null);
                          controller.pdfStore.setInitialDateUser(null);
                          controller.pdfStore.setUserID(null);
                        },
                        checkColor: AppThemeLight().getTheme().primaryColor,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Eficiência das Campanhas',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: (controller.pdfStore.initialDateProductBR != null &&
                            controller.pdfStore.finalDateProductBR != null &&
                            controller.store.productEficiency)
                        ? Card(
                            elevation: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "Início : " +
                                        controller
                                            .pdfStore.initialDateProductBR,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Final : " +
                                        controller.pdfStore.finalDateProductBR,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ),
                  Container(
                      //height: 50,
                      child: controller.store.productEficiency
                          ? RaisedButton(
                              child: Text('Marcar datas',
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              color: AppThemeLight().getTheme().primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              onPressed: () {
                                _productDate(context);
                              },
                            )
                          : SizedBox()),

                  // ! ENTERPRISE REPORT

                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: controller.store.enterpriseReport,
                        onChanged: (value) {
                          controller.store.setChoice('5');
                          controller.store.setEnterpriseReport();
                          controller.store.clientsWithoutContact = false;
                          controller.store.clientsWithoutPurchase = false;
                          controller.store.clientsThatSpentMore = false;
                          controller.store.productEficiency = false;
                          controller.store.userReport = false;

                          controller.pdfStore.setInitialDateProduct(null);
                          controller.pdfStore.setfinalDateProduct(null);
                          controller.pdfStore.setInitialDateProductBR(null);
                          controller.pdfStore.setfinalDateProductBR(null);

                          controller.pdfStore.setInitialDateUserBR(null);
                          controller.pdfStore.setfinalDateUserBR(null);
                          controller.pdfStore.setfinalDateUser(null);
                          controller.pdfStore.setInitialDateUser(null);
                          controller.pdfStore.setUserID(null);
                        },
                        checkColor: AppThemeLight().getTheme().primaryColor,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Resumo Gerencial da Empresa',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: (controller.pdfStore.initialDateEnterpriseBR !=
                                null &&
                            controller.pdfStore.finalDateEnterpriseBR != null &&
                            controller.store.enterpriseReport)
                        ? Card(
                            elevation: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "Início : " +
                                        controller
                                            .pdfStore.initialDateEnterpriseBR,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Final : " +
                                        controller
                                            .pdfStore.finalDateEnterpriseBR,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ),
                  Container(
                      child: controller.store.enterpriseReport
                          ? RaisedButton(
                              child: Text('Marcar datas',
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              color: AppThemeLight().getTheme().primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              onPressed: () {
                                _enterpriseDate(context);
                              },
                            )
                          : SizedBox()),

                  // ! USER REPORT

                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: controller.store.userReport,
                        onChanged: (value) {
                          controller.store.setChoice('6');
                          controller.store.setUserReport();
                          controller.store.clientsWithoutContact = false;
                          controller.store.clientsWithoutPurchase = false;
                          controller.store.clientsThatSpentMore = false;
                          controller.store.productEficiency = false;
                          controller.store.enterpriseReport = false;

                          controller.pdfStore.setInitialDateProduct(null);
                          controller.pdfStore.setfinalDateProduct(null);
                          controller.pdfStore.setInitialDateProductBR(null);
                          controller.pdfStore.setfinalDateProductBR(null);

                          controller.pdfStore.setInitialDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterpriseBR(null);
                          controller.pdfStore.setfinalDateEnterprise(null);
                          controller.pdfStore.setInitialDateEnterprise(null);
                        },
                        checkColor: AppThemeLight().getTheme().primaryColor,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Resumo Gerencial de um Usuário',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      child: controller.store.userReport
                          ? FutureBuilder(
                              future: controller.userRepository.getUsers(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                                        child: SingleChildScrollView(
                                            child: dropDownMenu(snapshot.data)),
                                      );
                                    }
                                    break;
                                }
                                return Container();
                              },
                            )
                          : SizedBox()),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: (controller.pdfStore.initialDateUserBR != null &&
                            controller.pdfStore.finalDateUserBR != null &&
                            controller.store.userReport)
                        ? Card(
                            elevation: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "Início : " +
                                        controller.pdfStore.initialDateUserBR,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Final : " +
                                        controller.pdfStore.finalDateUserBR,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ),
                  Container(
                      child: controller.store.userReport
                          ? RaisedButton(
                              child: Text('Marcar datas',
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              color: AppThemeLight().getTheme().primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              onPressed: () {
                                _userDate(context);
                              },
                            )
                          : SizedBox()),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<Null> _productDate(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: new DateTime.now(),
        initialLastDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: DateTime.now());

    if (picked != null) {
      controller.pdfStore.setInitialDateProductBR(
          formatDate(picked[0], [dd, '/', mm, '/', yyyy]));
      controller.pdfStore.setfinalDateProductBR(
          formatDate(picked[1], [dd, '/', mm, '/', yyyy]));
      controller.pdfStore.setInitialDateProduct(
          formatDate(picked[0], [yyyy, '-', mm, '-', dd]));
      controller.pdfStore
          .setfinalDateProduct(formatDate(picked[1], [yyyy, '-', mm, '-', dd]));
    }
  }

  Future<Null> _enterpriseDate(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: new DateTime.now(),
        initialLastDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: DateTime.now());

    if (picked != null) {
      controller.pdfStore.setInitialDateEnterpriseBR(
          formatDate(picked[0], [dd, '/', mm, '/', yyyy]));
      controller.pdfStore.setfinalDateEnterpriseBR(
          formatDate(picked[1], [dd, '/', mm, '/', yyyy]));
      controller.pdfStore.setInitialDateEnterprise(
          formatDate(picked[0], [yyyy, '-', mm, '-', dd]));
      controller.pdfStore.setfinalDateEnterprise(
          formatDate(picked[1], [yyyy, '-', mm, '-', dd]));
    }
  }

  Future<Null> _userDate(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: new DateTime.now(),
        initialLastDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: DateTime.now());

    if (picked != null) {
      controller.pdfStore.setInitialDateUserBR(
          formatDate(picked[0], [dd, '/', mm, '/', yyyy]));
      controller.pdfStore
          .setfinalDateUserBR(formatDate(picked[1], [dd, '/', mm, '/', yyyy]));
      controller.pdfStore
          .setInitialDateUser(formatDate(picked[0], [yyyy, '-', mm, '-', dd]));
      controller.pdfStore
          .setfinalDateUser(formatDate(picked[1], [yyyy, '-', mm, '-', dd]));
    }
  }

  // ***********************************************************************************

  Widget dropDownMenu(List<UserModel> users) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButtonHideUnderline(
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
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(
                          child: Text("Vendedores",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'Indie')),
                        ),
                      ),
                      onChanged: (_) async {
                        controller.pdfStore.setUserID(_);
                      },
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      value: controller.pdfStore.idUser,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
