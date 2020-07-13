import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/reports/clients/clients_spent_more_model.dart';
import 'package:simex_app/app/models/reports/clients/clients_without_contact_model.dart';
import 'package:simex_app/app/models/reports/clients/clients_without_purchase.dart';
import 'package:simex_app/app/models/reports/enterprise/enterprise_report_model.dart';
import 'package:simex_app/app/models/reports/enterprise/user_report_model.dart';
import 'package:simex_app/app/models/reports/products/product_efective_eficiency_model.dart';
import 'package:simex_app/app/models/reports/products/product_lost_eficiency_model.dart';
import 'package:simex_app/app/models/reports/products/product_pending_eficiency_model.dart';
import 'package:simex_app/app/modules/pdf/pdf_viewer_page.dart';
import 'pdf_controller.dart';

class PdfPage extends StatefulWidget {
  final String title;
  const PdfPage({Key key, this.title = "Pdf", this.choice}) : super(key: key);
  final String choice;

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends ModularState<PdfPage, PdfController> {
  //use 'controller' variable to access controller

  final pdf = pw.Document();

  bool is_loaded;

  @override
  void initState() {
    is_loaded = false;
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      setState(() {
        is_loaded = true;
      });
    });
  }

  //enterpriseReportModel.toJson()['ActivePhone'][0]['activePhone'].toString()

  _clientsWitoutPurchase(context) async {
    List<ClientsWithoutPurchase> data = controller.clientsWithoutPurchase.value;
    final pw.Document pdf = pw.Document(deflate: zlib.encode);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5.copyWith(marginTop: 0),
        margin: pw.EdgeInsets.fromLTRB(16, 16, 16, 16),
        build: (context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text(
                        formatDate(
                            DateFormat("yyyy-MM-dd")
                                .parse(DateTime.now().toString()),
                            [dd, '/', mm, '/', yyyy]).toString(),
                      ),
                      pw.Center(
                          child: pw.Text("SIMEX MÁQUINAS AGRICOLAS LTDA",
                              style: pw.TextStyle(fontSize: 14),
                              textAlign: pw.TextAlign.center)),
                      pw.Text('')
                    ])),
            pw.Center(
              child: pw.Text("Clientes sem compra a mais de " +
                  controller.store.daysPurchaseURL +
                  " dias"),
            ),
            pw.SizedBox(height: 15),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>['Nome', 'CPF', 'Telefone', 'Última Compra'],
              ...data.map((item) => [
                    item.name,
                    item.cpf,
                    item.phone.toString(),
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(item.lastPurchase),
                        [dd, '/', mm, '/', yyyy]).toString()
                  ])
            ]),
          ];
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/reports.pdf';
    final File file = File(path);
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
    await file.writeAsBytes(pdf.save());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerPage(path: path),
      ),
    );
  }

  _clientsWitoutContact(context) async {
    List<ClientsWithoutContact> data = controller.clientsWithoutContact.value;
    final pw.Document pdf = pw.Document(deflate: zlib.encode);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5.copyWith(marginTop: 0),
        margin: pw.EdgeInsets.fromLTRB(16, 16, 16, 16),
        build: (context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text(
                        formatDate(
                            DateFormat("yyyy-MM-dd")
                                .parse(DateTime.now().toString()),
                            [dd, '/', mm, '/', yyyy]).toString(),
                      ),
                      pw.Center(
                          child: pw.Text("SIMEX MÁQUINAS AGRICOLAS LTDA",
                              style: pw.TextStyle(fontSize: 14),
                              textAlign: pw.TextAlign.center)),
                      pw.Text('')
                    ])),
            pw.Center(
              child: pw.Text("Clientes sem contato a mais de " +
                  controller.store.daysContactsURL +
                  " dias"),
            ),
            pw.SizedBox(height: 15),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>['Nome', 'CPF', 'Telefone', 'Último Contato'],
              ...data.map((item) => [
                    item.name,
                    item.cpf,
                    item.phone.toString(),
                    formatDate(DateFormat("yyyy-MM-dd").parse(item.lastContact),
                        [dd, '/', mm, '/', yyyy]).toString()
                  ])
            ]),
          ];
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/reports.pdf';
    final File file = File(path);
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
    await file.writeAsBytes(pdf.save());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerPage(path: path),
      ),
    );
  }

  _clientsSpentMore(context) async {
    List<ClientsSpentMore> data = controller.clientsSpentMore.value;
    final pw.Document pdf = pw.Document(deflate: zlib.encode);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5.copyWith(marginTop: 0),
        margin: pw.EdgeInsets.fromLTRB(16, 16, 16, 16),
        build: (context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text(
                        formatDate(
                            DateFormat("yyyy-MM-dd")
                                .parse(DateTime.now().toString()),
                            [dd, '/', mm, '/', yyyy]).toString(),
                      ),
                      pw.Center(
                          child: pw.Text("SIMEX MÁQUINAS AGRICOLAS LTDA",
                              style: pw.TextStyle(fontSize: 14),
                              textAlign: pw.TextAlign.center)),
                      pw.Text('')
                    ])),
            pw.Center(
              child: pw.Text("Lista de clientes que mais gastaram"),
            ),
            pw.SizedBox(height: 15),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>['Nome', 'CPF', 'Telefone', 'Valor Gasto'],
              ...data.map((item) => [
                    item.name,
                    item.cpf,
                    item.phone.toString(),
                    item.valueSpent != null ? NumberFormat.simpleCurrency(locale: 'pt_Br')
                        .format(double.parse(item.valueSpent)) : "R\$ 0.0",
                  ])
            ]),
          ];
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/reports.pdf';
    final File file = File(path);
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
    await file.writeAsBytes(pdf.save());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerPage(path: path),
      ),
    );
  }

  _efectiveSellEficiency(context) async {
    List<ProductsEfectiveEfficiencyModel> data =
        controller.productsEfectiveEficiency.value;

    List<ProductsePendingEfficiencyModel> dataPending =
        controller.productsPendingEficiency.value;

    List<ProductsLostEfficiencyModel> dataLost =
        controller.productsLostEficiency.value;

    final pw.Document pdf = pw.Document(deflate: zlib.encode);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5.copyWith(marginTop: 0),
        margin: pw.EdgeInsets.fromLTRB(16, 16, 16, 16),
        build: (context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text(
                        formatDate(
                            DateFormat("yyyy-MM-dd")
                                .parse(DateTime.now().toString()),
                            [dd, '/', mm, '/', yyyy]).toString(),
                      ),
                      pw.Center(
                          child: pw.Text("SIMEX MÁQUINAS AGRICOLAS LTDA",
                              style: pw.TextStyle(fontSize: 14),
                              textAlign: pw.TextAlign.center)),
                      pw.Text('')
                    ])),
            pw.Center(
              child: pw.Text(
                "Eficiência das Campanhas entre " +
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          controller.store.initialDateProduct,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString() +
                    " e " +
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          controller.store.finalDateProduct,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString(),
              ),
            ),
            pw.SizedBox(height: 15),
            pw.Text("Vendas Efetivas"),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>[
                'Campanha',
                'Data Ínicio',
                'Data Final',
                'Preço',
                'Qtd Vendas',
                'Valor de Vendas'
              ],
              ...data.map((item) => [
                    item.productName,
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          item.initialDate,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString(),
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          item.finalDate,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString(),
                    NumberFormat.simpleCurrency(locale: 'pt_Br')
                        .format(double.parse(item.price)),
                    item.sales.toString(),
                    NumberFormat.simpleCurrency(locale: 'pt_Br')
                        .format(double.parse(item.valueSold)),
                  ])
            ]),
            pw.SizedBox(height: 15),
            pw.Text("Vendas Pendentes"),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>[
                'Campanha',
                'Data Ínicio',
                'Data Final',
                'Preço',
                'Qtd Vendas Pendentes'
              ],
              ...dataPending.map((item) => [
                    item.productName,
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          item.initialDate,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString(),
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          item.finalDate,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString(),
                    NumberFormat.simpleCurrency(locale: 'pt_Br')
                        .format(double.parse(item.price)),
                    item.contacts.toString(),
                  ])
            ]),
            pw.SizedBox(height: 15),
            pw.Text("Vendas Perdidas"),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>[
                'Campanha',
                'Data Ínicio',
                'Data Final',
                'Preço',
                'Qtd Vendas Perdidas',
              ],
              ...dataLost.map((item) => [
                    item.productName,
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          item.initialDate,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString(),
                    formatDate(
                        DateFormat("yyyy-MM-dd").parse(
                          item.finalDate,
                        ),
                        [dd, '/', mm, '/', yyyy]).toString(),
                    NumberFormat.simpleCurrency(locale: 'pt_Br')
                        .format(double.parse(item.price)),
                    item.losts.toString(),
                  ])
            ]),
          ];
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/reports.pdf';
    final File file = File(path);
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
    await file.writeAsBytes(pdf.save());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerPage(path: path),
      ),
    );
  }

  _enterpriseReport(context) async {
    EnterpriseReportModel enterpriseReportModel =
        controller.enterpriseReportModel.value;

    final pw.Document pdf = pw.Document(deflate: zlib.encode);

    pdf.addPage(
      pw.MultiPage(
        margin: pw.EdgeInsets.fromLTRB(32, 16, 32, 32),
        pageFormat: PdfPageFormat.a5.copyWith(marginTop: 0),
        build: (context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text(
                        formatDate(
                            DateFormat("yyyy-MM-dd")
                                .parse(DateTime.now().toString()),
                            [dd, '/', mm, '/', yyyy]).toString(),
                      ),
                      pw.Center(
                          child: pw.Text("SIMEX MÁQUINAS AGRICOLAS LTDA",
                              style: pw.TextStyle(fontSize: 14),
                              textAlign: pw.TextAlign.center)),
                      pw.Text('')
                    ])),
            pw.Text(
                "Contatos realizados no período de : ${controller.store.initialDateEnterpriseBR} à ${controller.store.finalDateEnterpriseBR}"),
            pw.SizedBox(height: 5),
            pw.Text("Usuário : Todos"),
            pw.SizedBox(height: 15),
            pw.Center(
              child: pw.Text("Distruibuição dos Contatos",
                  style: pw.TextStyle(fontSize: 12)),
            ),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(
                cellStyle: pw.TextStyle(fontSize: 10),
                context: context,
                data: <List<String>>[
                  <String>[
                    'Tipo de Contato',
                    'Quantidade',
                  ],
                  <String>[
                    'Telef. Ativo',
                    enterpriseReportModel.toJson()['ActivePhone'].toString() !=
                            '[]'
                        ? enterpriseReportModel
                            .toJson()['ActivePhone'][0]['activePhone']
                            .toString()
                        : '0',
                  ],
                  <String>[
                    'Visita Externa',
                    enterpriseReportModel
                                .toJson()['ExternalVisit']
                                .toString() !=
                            '[]'
                        ? enterpriseReportModel
                            .toJson()['ExternalVisit'][0]['externalVisit']
                            .toString()
                        : '0',
                  ],
                  <String>[
                    'Telef. Recebido',
                    enterpriseReportModel.toJson()['ReceivedCall'].toString() !=
                            '[]'
                        ? enterpriseReportModel
                            .toJson()['ReceivedCall'][0]['receivedCall']
                            .toString()
                        : '0',
                  ],
                  <String>[
                    'Balcão',
                    enterpriseReportModel.toJson()['Balcony'].toString() != '[]'
                        ? enterpriseReportModel
                            .toJson()['Balcony'][0]['balconyContact']
                            .toString()
                        : '0',
                  ],
                  <String>[
                    'Total de Contatos',
                    enterpriseReportModel
                                .toJson()['AmountContacts']
                                .toString() !=
                            '[]'
                        ? enterpriseReportModel
                            .toJson()['AmountContacts'][0]['total']
                            .toString()
                        : '0',
                  ],
                ]),
            pw.SizedBox(height: 20),
            pw.Center(
              child: pw.Text("Resultados", style: pw.TextStyle(fontSize: 12)),
            ),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(
                cellStyle: pw.TextStyle(fontSize: 10),
                context: context,
                data: <List<String>>[
                  <String>['', 'Valor/Quantidade'],
                  <String>[
                    'Valor Total de Venda',
                    (enterpriseReportModel.toJson()['ValueSold'].toString() !=
                                '[]' &&
                            enterpriseReportModel.toJson()['ValueSold'][0]
                                    ['valueSoldTotal'] !=
                                null)
                        ? NumberFormat.simpleCurrency(locale: 'pt_Br')
                            .format(double.parse(
                            enterpriseReportModel
                                .toJson()['ValueSold'][0]['valueSoldTotal']
                                .toString(),
                          ))
                        : 'R\$ 0.0',
                  ],
                  <String>[
                    'Quantidade de Vendas',
                    enterpriseReportModel
                                .toJson()['AmountEfectiveSell']
                                .toString() !=
                            '[]'
                        ? enterpriseReportModel
                            .toJson()['AmountEfectiveSell'][0]
                                ['amountOfEfectiveSell']
                            .toString()
                        : '0',
                  ],
                ]),
          ];
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/reports.pdf';
    final File file = File(path);
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
    await file.writeAsBytes(pdf.save());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerPage(path: path),
      ),
    );
  }

  _userReport(context) async {
    UserReportModel userReportModel = controller.userReportModel.value;
    final pw.Document pdf = pw.Document(deflate: zlib.encode);

    pdf.addPage(
      pw.MultiPage(
        margin: pw.EdgeInsets.fromLTRB(32, 16, 32, 32),
        pageFormat: PdfPageFormat.a5.copyWith(marginTop: 0),
        build: (context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text(
                        formatDate(
                            DateFormat("yyyy-MM-dd")
                                .parse(DateTime.now().toString()),
                            [dd, '/', mm, '/', yyyy]).toString(),
                      ),
                      pw.Center(
                          child: pw.Text("SIMEX MÁQUINAS AGRICOLAS LTDA",
                              style: pw.TextStyle(fontSize: 14),
                              textAlign: pw.TextAlign.center)),
                      pw.Text('')
                    ])),
            pw.Text(
                "Contatos realizados no período de : ${controller.store.initialDateUserBR} à ${controller.store.finalDateUserBR}"),
            pw.SizedBox(height: 5),
            pw.Text("Usuário : " + controller.store.userName),
            pw.SizedBox(height: 15),
            pw.Center(
              child: pw.Text("Distruibuição dos Contatos",
                  style: pw.TextStyle(fontSize: 12)),
            ),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(
                cellStyle: pw.TextStyle(fontSize: 10),
                context: context,
                data: <List<String>>[
                  <String>[
                    'Tipo de Contato',
                    'Quantidade',
                  ],
                  <String>[
                    'Telef. Ativo',
                    userReportModel.toJson()['ActivePhone'].toString() != '[]'
                        ? userReportModel
                            .toJson()['ActivePhone'][0]['amount']
                            .toString()
                        : '0',
                  ],
                  <String>[
                    'Visita Externa',
                    userReportModel.toJson()['ExternalVisit'].toString() != '[]'
                        ? userReportModel
                            .toJson()['ExternalVisit'][0]['amount']
                            .toString()
                        : '0',
                  ],
                  <String>[
                    'Telef. Recebido',
                    userReportModel.toJson()['ReceivedCall'].toString() != '[]'
                        ? userReportModel
                            .toJson()['ReceivedCall'][0]['amount']
                            .toString()
                        : '0',
                  ],
                  <String>[
                    'Balcão',
                    userReportModel.toJson()['Balcony'].toString() != '[]'
                        ? userReportModel
                            .toJson()['Balcony'][0]['amount']
                            .toString()
                        : '0',
                  ],
                  <String>[
                    'Total de Contatos',
                    userReportModel.toJson()['AmountContacts'].toString() !=
                            '[]'
                        ? userReportModel
                            .toJson()['AmountContacts'][0]['amount']
                            .toString()
                        : '0',
                  ],
                ]),
            pw.SizedBox(height: 20),
            pw.Center(
              child: pw.Text("Resultados", style: pw.TextStyle(fontSize: 12)),
            ),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(
                cellStyle: pw.TextStyle(fontSize: 10),
                context: context,
                data: <List<String>>[
                  <String>['', 'Valor/Quantidade'],
                  <String>[
                    'Valor Total de Venda',
                    (userReportModel.toJson()['ValueSoldTotal'].toString() !=
                                '[]' &&
                            userReportModel.toJson()['ValueSoldTotal'][0]
                                    ['valueSoldTotal'] !=
                                null)
                        ? NumberFormat.simpleCurrency(locale: 'pt_Br')
                            .format(double.parse(
                            userReportModel
                                .toJson()['ValueSoldTotal'][0]['valueSoldTotal']
                                .toString(),
                          ))
                        : 'R\$ 0.0',
                  ],
                  <String>[
                    'Quantidade de Vendas',
                    userReportModel
                                .toJson()['AmountOfEfectiveSell']
                                .toString() !=
                            '[]'
                        ? userReportModel
                            .toJson()['AmountOfEfectiveSell'][0]
                                ['amountOfEfectiveSell']
                            .toString()
                        : '0',
                  ],
                ]),
          ];
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/reports.pdf';
    final File file = File(path);
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
    //await Printing.sharePdf(bytes: pdf.save(), filename: 'my-document.pdf');
    await file.writeAsBytes(pdf.save());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerPage(path: path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Gerar PDF do Relatório'),
          centerTitle: false,
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Modular.to.pushNamedAndRemoveUntil(
                      '/contacts', ModalRoute.withName('/contacts'));
                },
                child: Text(
                  'Voltar a página principal',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.grey.withOpacity(0.4)),
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('lib/assets/images/reports.png'),
            Container(
              child: is_loaded
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: AppThemeLight().getTheme().primaryColor,
                            onPressed: () {
                              if (widget.choice == '1') {
                                _clientsWitoutContact(context);
                              } else if (widget.choice == '2') {
                                _clientsWitoutPurchase(context);
                              } else if (widget.choice == '3') {
                                _clientsSpentMore(context);
                              } else if (widget.choice == '4') {
                                _efectiveSellEficiency(context);
                              } else if (widget.choice == '5') {
                                _enterpriseReport(context);
                              } else if (widget.choice == '6') {
                                _userReport(context);
                              }
                            },
                            child: Text('GERAR PDF',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      );
    });
  }

  Widget customList(List<ClientsWithoutContact> clients) {
    return ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: ListTile(
              trailing: Icon(
                Icons.build,
                size: 30,
                color: AppThemeLight().getTheme().primaryColor,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(clients[index].name),
                  Text(clients[index].cpf),
                  Text(clients[index].lastContact),
                ],
              ),
            ),
          );
        });
  }
}
