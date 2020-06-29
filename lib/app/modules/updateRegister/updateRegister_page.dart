import 'package:date_format/date_format.dart';
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

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('ATENÇÃO!'),
            content: new Text(
                'Você pode ter alterações que não foram salvas, você realmente deseja sair?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Não'),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  controller.store.cleanFields();
                },
                child: new Text('Sair'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Atualização de Registro'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Card(
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Container(
                        width: double.maxFinite,
                        child: Center(
                            child: Container(
                          color: Colors.black,
                          width: double.maxFinite,
                          child: Text(
                            'Tipo de contato realizado',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        )),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          contactFromRadioButton(
                              'Telefone Ativo', 'Telefone Ativo'),
                          contactFromRadioButton(
                              'Visita Externa', 'Visita Externa'),
                          contactFromRadioButton(
                              'Telefone Recebido', 'Telefone Recebido'),
                          contactFromRadioButton('Balcao', 'Balcao'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: <Widget>[
                      Center(
                          child: Container(
                        color: Colors.black,
                        width: double.maxFinite,
                        child: Text(
                          'Status do Contato Realizado',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )),
                      SizedBox(height: 30),
                      Row(
                        children: <Widget>[
                          statusRadioButton('Venda Efetiva', 'Venda Efetiva'),
                          statusRadioButton('Venda Pendente', 'Venda Pendente'),
                          statusRadioButton('Venda Perdida', 'Venda Perdida'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.maxFinite,
                    child: controller.store.efectiveSell
                        ? Padding(
                          padding: const EdgeInsets.fromLTRB(8, 10, 10, 10),
                          child: Text(
                              'Produto : ' +
                                  widget.nextContactsModel.productName,
                              style: TextStyle(fontSize: 20),
                            ),
                        )
                        : SizedBox(),
                  ),
                  
                  Center(
                      child: controller.store.efectiveSell
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  controller.store
                                      .setAmountSold(int.parse(value));
                                  controller.store.setValueSold(
                                      controller.store.amountSold.toDouble() *
                                          double.parse(widget.nextContactsModel.price)).toString();
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Quantidade Vendida",
                                    border: OutlineInputBorder()),
                              ),
                            )
                          : SizedBox()),
                  Container(
                      width: double.maxFinite,
                      child: controller.store.efectiveSell &&
                              controller.store.amountSold != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8, 10, 10, 10),
                              child: Text(
                                "Valor Total da Venda: R\$ " +
                                    (controller.store.amountSold.toDouble() *
                                            double.parse(widget.nextContactsModel.price))
                                        .toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          : SizedBox()),
                  Center(
                      child: controller.store.lostSell
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                    child: Container(
                                  color: Colors.black,
                                  width: double.maxFinite,
                                  child: Text(
                                    'Motivo da Venda Perdida',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                )),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    reasonRadioButton('Estoque', 'Estoque'),
                                    reasonRadioButton('Interesse', 'Interesse'),
                                    reasonRadioButton('Preço', 'Preço'),
                                  ],
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: controller.store.setObservation,
                                decoration: InputDecoration(
                                  labelText: "Observação",
                                  border: OutlineInputBorder(),
                                ),
                                expands: false,
                                maxLines: 3,
                              ),
                            )),
                  SizedBox(height: 30),
                  Center(
                      child: controller.store.pendingSell
                          ? Container(
                              width: double.maxFinite,
                              child: RaisedButton(
                                color: Colors.blue,
                                onPressed: () {
                                  _selectDate(context);
                                },
                                child: Text('Agendar Próximo Contato'),
                              ))
                          : SizedBox()),
                  Container(
                    width: double.maxFinite,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        setRegisterModelToUpdate();
                        controller.store.cleanFields();
                      },
                      child: Text('SALVAR'),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget statusRadioButton(String value, String text) {
    return Observer(
      builder: (_) {
        return Flexible(
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
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

  Widget reasonRadioButton(String value, String text) {
    return Observer(
      builder: (_) {
        return Flexible(
            child: Column(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
            Radio(
              value: value,
              groupValue: controller.store.reason,
              onChanged: (value) {
                controller.store.setReason(value);
                print(controller.store.reason);
              },
            ),
          ],
        ));
      },
    );
  }

  Widget contactFromRadioButton(String value, String text) {
    return Observer(
      builder: (_) {
        return Flexible(
            child: Column(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
            Radio(
              value: value,
              groupValue: controller.store.contactFrom,
              onChanged: (value) {
                controller.store.setContactFrom(value);
                print(controller.store.contactFrom);
              },
            ),
          ],
        ));
      },
    );
  }

  setRegisterModelToUpdate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);

    var registerModel = RegisterModel(
        id: widget.nextContactsModel.id,
        idClient: widget.nextContactsModel.idClient,
        idUser: widget.nextContactsModel.idUser,
        productId: widget.nextContactsModel.productId,
        
        dateContact: formatted,
        nextContact:
            controller.store.pendingSell ? controller.store.nextContact : "",
        observation: controller.store.observation ?? "",
        productAmount: controller.store.amountSold ??=
            widget.nextContactsModel.productAmount,
        reason: controller.store.reason ?? "",
        status: controller.store.efectiveSell
            ? "Venda Efetiva"
            : controller.store.pendingSell ? "Venda Pendente" : "Venda Perdida",
        valueSold: controller.store.valueSold != null
            ? controller.store.valueSold.toDouble().toString()
            : '0.0',
        contactFrom: controller.store.contactFrom);

    print(registerModel.toJson());
    controller.updateRegister(registerModel, widget.nextContactsModel.id);
  }

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
      controller.store.setNextContact(usDate);
      controller.store.setNextContactBr(brDate);
    }
  }
}
