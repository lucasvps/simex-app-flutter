import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/models/next_contacts_model.dart';
import 'package:simex_app/app/modules/registerInfo/widgets.dart/custom_info_register_row.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_module.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_page.dart';
import 'registerInfo_controller.dart';

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
                  readOnly: false,
                ),
                CustomInfoRegisterRow(
                  field: 'Tipo de Contato',
                  value: widget.contactsModel.contactFrom,
                  readOnly: false,
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    onPressed: () {
                      // TODO: ABRIR O DATE PICKER LÁ E PA
                    },
                    child: Text(
                        'CLIENTE NÃO ATENDEU, AGENDAR NOVA DATA PARA CONTATO.'),
                    color: Colors.orange,
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
