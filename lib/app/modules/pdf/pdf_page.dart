import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/reports/clients_without_contact_model.dart';
import 'package:simex_app/app/modules/activesProducts/actives_products_controller.dart';
import 'package:simex_app/app/modules/newProduct/new_product_controller.dart';
import 'package:simex_app/app/modules/pdf/pdf_viewer_page.dart';
import 'pdf_controller.dart';
import 'package:pdf/pdf.dart';

class PdfPage extends StatefulWidget {
  final String title;
  const PdfPage({Key key, this.title = "Pdf"}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends ModularState<PdfPage, PdfController> {
  //use 'controller' variable to access controller

  List<ClientsWithoutContact> listClients = [];

  final pdf = pw.Document();

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(level: 0, child: pw.Text("Easy Approach Document")),
            pw.Paragraph(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
            pw.Paragraph(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
            pw.Header(level: 1, child: pw.Text("Second Heading")),
            pw.Paragraph(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
            pw.Paragraph(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
            pw.Paragraph(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
          ];
        }));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/report.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  _generatePdfAndView(context) async {
    List<ClientsWithoutContact> data = controller.clientsWithoutContact.value;
    final pw.Document pdf = pw.Document(deflate: zlib.encode);

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
              pw.Table.fromTextArray(context: context, data: <List<String>>[
                <String>['Name', 'cpf', 'phone', 'ultimo contato'],
                ...data.map(
                    (item) => [item.name, item.cpf, item.phone.toString(), item.lastContact])
              ]),
            ],
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/baseball_teams.pdf';
    final File file = File(path);
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
        floatingActionButton: FloatingActionButton(onPressed: () async {
          // var listOfClients = controller.clientsWithoutContact.value;
          // listOfClients.map((e){
          //   print('meu piru');
          // });

          _generatePdfAndView(context);


          // writeOnPdf();
          // await savePdf();

          // Directory documentDirectory = await getApplicationDocumentsDirectory();

          // String documentPath = documentDirectory.path;

          // String fullPath = "$documentPath/report.pdf";

          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => PDFViewerPage(
          //               path: fullPath,
          //             )));
        }),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(child: Observer(builder: (_) {
          var listOfClients = controller.clientsWithoutContact.value;
          
          if (controller.clientsWithoutContact.value == null) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.clientsWithoutContact.value.isEmpty) {
            return Center(
                child: Text(
              "Você nao possui horários que já foram finalizados!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ));
          }
          return Card(
            margin: EdgeInsets.all(10),
            color: Color(0xffE1BEE7),
            child: ListView.builder(
                itemCount: listOfClients.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Text(listOfClients[index].name),
                  );
                }),
          );
        })),
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
