import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reports_controller.dart';

class ReportsPage extends StatefulWidget {
  final String title;
  const ReportsPage({Key key, this.title = "Reports"}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends ModularState<ReportsPage, ReportsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (context) {
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        controller.store.setClientsWithoutContact();
                      },
                      color: Colors.red,
                      child: Text(
                          'Relatório de clients sem contato a mais de NNN dias'),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: controller.store.clientsWithoutContact
                      ? TextFormField(
                          onChanged: controller.pdfStore.setDaysContactsURL,
                          decoration: InputDecoration(),
                        )
                      : SizedBox()),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: controller.store.clientsWithoutContact
                      ? RaisedButton(
                          child: Text('Gerar Relatório'),
                          onPressed: () {
                            Modular.to.pushNamed('/pdfCreate/5');
                          },
                        )
                      : SizedBox()),
            ],
          ),
        );
      }),
    );
  }
}
