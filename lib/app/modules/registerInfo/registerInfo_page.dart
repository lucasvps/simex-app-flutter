import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/models/next_contacts_model.dart';
import 'package:simex_app/app/modules/registerInfo/widgets.dart/custom_info_register_row.dart';
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

  String choice;
  bool anwser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do Registro'),
        centerTitle: true,
      ),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
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
          FlatButton(
            onPressed: () {
              // TODO: ABRIR O DATE PICKER LÁ E PA
            },
            child: Text('CLIENTE NÃO ATENDEU, AGENDAR NOVO CONTATO'),
            color: Colors.blue,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              customRadioButton('Venda Efetiva', 'Venda Efetiva', choice),
              customRadioButton('Venda Pendente', 'Venda Pendente', choice),
              customRadioButton('Venda Perdida', 'Venda Perdida', choice),
            ],
          ),
        ],
      ),
    );
  }

  Widget customRadioButton(String value, String text, groupValue) {
    return Flexible(
      child: ListTile(
        title: Text(text),
        leading: Radio(
          value: value,
          groupValue: choice,
          onChanged: (value) {
            // TODO: o groupValue vai ser o store.status ;
            // TODO: na hora do onChanged, chama o store.setStatus(value);
            // TODO: acho que da certo assim.
            setState(() {
              choice = value;
              print(groupValue);
            });
          },
        ),
      ),
    );
  }
}
