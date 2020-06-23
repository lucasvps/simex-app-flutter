import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/models/next_contacts_model.dart';
import 'package:simex_app/app/models/register_model.dart';
import 'package:simex_app/app/modules/registerInfo/widgets.dart/custom_info_register_row.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_page.dart';
import 'registerInfo_controller.dart';
import 'package:date_format/date_format.dart';

class RegisterInfoPage extends StatefulWidget {
  final String title;
  const RegisterInfoPage(
      {Key key, this.title = "RegisterInfo", this.contactsModel})
      : super(key: key);
  final NextContactsModel contactsModel;

  @override
  _RegisterInfoPageState createState() => _RegisterInfoPageState();
}

class _RegisterInfoPageState
    extends ModularState<RegisterInfoPage, RegisterInfoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do Registro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Card(
            child: Column(
              children: <Widget>[
                CustomInfoRegisterRow(
                  field: 'Cliente',
                  value: widget.contactsModel.name,
                  readOnly: true,
                ),
                CustomInfoRegisterRow(
                  field: 'Telefone',
                  value: widget.contactsModel.phone,
                  readOnly: true,
                ),
                CustomInfoRegisterRow(
                  field: 'Email',
                  value: widget.contactsModel.email,
                  readOnly: true,
                ),
                CustomInfoRegisterRow(
                  field: 'Loja',
                  value: widget.contactsModel.store,
                  readOnly: true,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: CustomInfoRegisterRow(
                        field: 'Produto',
                        value: widget.contactsModel.productName,
                        readOnly: true,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: CustomInfoRegisterRow(
                        field: 'Valor',
                        value: widget.contactsModel.value.toString(),
                        readOnly: true,
                      ),
                    )
                  ],
                ),
                CustomInfoRegisterRow(
                  field: 'Observação',
                  value: widget.contactsModel.observation,
                  readOnly: true,
                ),
                CustomInfoRegisterRow(
                  field: 'Data do contato',
                  value: widget.contactsModel.dateContact,
                  readOnly: true,
                ),
                CustomInfoRegisterRow(
                  field: 'Tipo de Contato',
                  value: widget.contactsModel.contactFrom,
                  readOnly: true,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      //Modular.to.pushNamed('/info/update');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateRegisterPage(
                                  nextContactsModel: widget.contactsModel)));
                    },
                    child:
                        Text('CLIENTE ATENDEU, ATUALIZAR CONTATO REALIZADO.'),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text(
                        'CLIENTE NÃO ATENDEU, AGENDAR NOVA DATA PARA CONTATO.'),
                    color: Colors.orange,
                  ),
                ),
                Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: controller.store.nextContactBR != null
                          ? Column(
                              children: <Widget>[
                                Text('Data Marcada Para Próximo Contato: ' +
                                    controller.store.nextContactBR),
                                RaisedButton(
                                  
                                  color: Colors.blue,
                                  onPressed: () {
                                    var updateRegister = RegisterModel(
                                      id: widget.contactsModel.id,
                                      idClient: widget.contactsModel.idClient,
                                      idUser: widget.contactsModel.idUser,
                                      clientName:widget.contactsModel.clientName,
                                      contactFrom: widget.contactsModel.contactFrom,
                                      dateContact: widget.contactsModel.dateContact,
                                      observation: widget.contactsModel.observation ??= "",
                                      productName: widget.contactsModel.productName,
                                      reason: widget.contactsModel.reason ??= "",
                                      status: widget.contactsModel.status,
                                      value: widget.contactsModel.value.toDouble(),
                                      valueSold: widget.contactsModel.valueSold.toDouble() ?? 0.0,
                                      nextContact: controller.store.nextContact
                                    );
                                    controller.updateRegister(updateRegister, widget.contactsModel.id);
                                  },
                                  child: Text('SALVAR E SAIR'),
                                )
                              ],
                            )
                          : SizedBox(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
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
