import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/models/next_contacts_model.dart';
import 'package:simex_app/app/models/register_model.dart';
import 'updateRegister_controller.dart';

class UpdateRegisterPage extends StatefulWidget {
  final String title;
  const UpdateRegisterPage(
      {Key key, this.title = "UpdateRegister", this.nextContactsModel})
      : super(key: key);

  final NextContactsModel nextContactsModel;

  @override
  _UpdateRegisterPageState createState() => _UpdateRegisterPageState();
}

class _UpdateRegisterPageState
    extends ModularState<UpdateRegisterPage, UpdateRegisterController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atualização de Registro' +
            widget.nextContactsModel.phone.toString()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                  width: double.maxFinite,
                  child: Card(
                    color: Colors.black,
                    child: Text(
                      'ATUALIZAR CONTATO FEITO HOJE',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                customRadioButton('Venda Efetiva', 'Venda Efetiva'),
                customRadioButton('Venda Pendente', 'Venda Pendente'),
                customRadioButton('Venda Perdida', 'Venda Perdida'),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Observer(builder: (_) {
              // TODO : FAZER UM SELECT BOX QUE ESQUECI O NOME AGORA
              return TextField(
                onChanged: controller.store.setContactFrom,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Tipo de contato"),
              );
            }),
            SizedBox(
              height: 50,
            ),
            Observer(builder: (_) {
              return Center(
                  child: controller.store.efectiveSell
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(child: Text('Valor Total: valor aqui')),
                              Flexible(
                                child: TextField(
                                  onChanged: (value) => controller.store
                                      .setValueSold(int.parse(value)),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Valor Vendido",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox());
            }),
            Observer(builder: (_) {
              return Center(
                  child: controller.store.lostSell
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                          child: Observer(builder: (_) {
                            return TextField(
                              onChanged: controller.store.setReason,
                              decoration: InputDecoration(
                                labelText: "Motivo da Venda Perdida",
                                border: OutlineInputBorder(),
                              ),
                              expands: false,
                              maxLines: 3,
                            );
                          }))
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                          child: Observer(builder: (_) {
                            return TextField(
                              onChanged: controller.store.setObservation,
                              decoration: InputDecoration(
                                labelText: "Observação",
                                border: OutlineInputBorder(),
                              ),
                              expands: false,
                              maxLines: 3,
                            );
                          })));
            }),
            Observer(builder: (_) {
              return Center(
                  child: controller.store.pendingSell
                      ? Container(
                          width: double.maxFinite,
                          child: RaisedButton(
                            color: Colors.blue,
                            onPressed: () {},
                            child: Text('Agendar Próximo Contato'),
                          ))
                      : SizedBox());
            }),
            Container(
              width: double.maxFinite,
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  setRegisterModelToUpdate();
                },
                child: Text('SALVAR'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customRadioButton(String value, String text) {
    return Observer(
      builder: (_) {
        return Flexible(
          child: ListTile(
            title: Text(text),
            leading: Radio(
              value: value,
              groupValue: controller.store.status,
              onChanged: (value) {
                controller.store.setStatus(value);
                controller.store.setValueSold(0);
                
                

                if (controller.store.status == "Venda Perdida") {
                  controller.store.lostSell = true;
                  controller.store.setObservation('');
                } else {
                  controller.store.lostSell = false;
                }

                if (controller.store.status == "Venda Pendente") {
                  controller.store.pendingSell = true;
                  controller.store.setReason('');
                } else {
                  controller.store.pendingSell = false;
                }

                if (controller.store.status == "Venda Efetiva") {
                  controller.store.efectiveSell = true;
                  controller.store.setReason('');
                } else {
                  controller.store.efectiveSell = false;
                }
              },
            ),
          ),
        );
      },
    );
  }

  setRegisterModelToUpdate() {
    print('entrou na function');
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(now);

    var registerModel = RegisterModel(
        clientName: widget.nextContactsModel.clientName,
        id: widget.nextContactsModel.id,
        idClient: widget.nextContactsModel.idClient,
        idUser: widget.nextContactsModel.idUser,
        productName: widget.nextContactsModel.productName,
        value: widget.nextContactsModel.value.toDouble(),
        dateContact: formatted,
        nextContact: controller.store.pendingSell ? "Proxima data aqui" : "",
        observation: controller.store.observation ?? "",
        reason: controller.store.reason ?? "",
        status: controller.store.efectiveSell
            ? "Venda Efetiva"
            : controller.store.pendingSell ? "Venda Pendente" : "Venda Perdida",
        valueSold: controller.store.valueSold != null
            ? controller.store.valueSold.toDouble()
            : 0.0,
        contactFrom: controller.store.contactFrom);

    print(registerModel.toJson());
  }
}
