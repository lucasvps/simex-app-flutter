import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
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
          title: Text(
            'Informações do Registro',
            style: GoogleFonts.montserrat(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/personal.png'),
                )),
              ),
              CustomInfoRegisterRow(
                field: 'CLIENTE',
                value: widget.contactsModel.name,
                readOnly: true,
              ),
              CustomInfoRegisterRow(
                field: 'TELEFONE',
                value: widget.contactsModel.phone,
                readOnly: true,
              ),
              CustomInfoRegisterRow(
                field: 'EMAIL',
                value: widget.contactsModel.email,
                readOnly: true,
              ),
              CustomInfoRegisterRow(
                field: 'LOJA',
                value: widget.contactsModel.store,
                readOnly: true,
              ),
              CustomInfoRegisterRow(
                field: 'PRODUTO',
                value: widget.contactsModel.productName ?? "",
                readOnly: true,
              ),
              CustomInfoRegisterRow(
                field: 'OBSERVAÇÃO',
                value: widget.contactsModel.observation ?? "",
                readOnly: true,
              ),
              CustomInfoRegisterRow(
                field: 'DATA DO CONTATO',
                value: formatDate(
                    DateFormat("yyyy-MM-dd")
                        .parse(widget.contactsModel.dateContact),
                    [dd, '/', mm, '/', yyyy]).toString(),
                readOnly: true,
              ),
              CustomInfoRegisterRow(
                field: 'TIPO DE CONTATO',
                value: widget.contactsModel.contactFrom,
                readOnly: true,
              ),
              Card(
                elevation: 20,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.phone),
                            onPressed: () {
                              FlutterPhoneDirectCaller.directCall(
                                  widget.contactsModel.phone);
                            }),
                        Text(
                          'Ligar para ' + widget.contactsModel.name,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 14, 8),
                          child: InkWell(
                            onTap: () {
                              FlutterOpenWhatsapp.sendSingleMessage(
                                  widget.contactsModel.phone, "");
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.028,
                              width: MediaQuery.of(context).size.height * 0.028,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('lib/assets/images/wpp.jpg'),
                              )),
                            ),
                          ),
                        ),
                        Text(
                          'Enviar mensagem para ' + widget.contactsModel.name,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: AppThemeLight().getTheme().primaryColor,
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
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text(
                        'CLIENTE NÃO ATENDEU, AGENDAR NOVA DATA PARA CONTATO.'),
                    color: Color(0xffFFF176).withOpacity(0.9),
                  ),
                ),
              ),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: controller.store.nextContactBR != null
                        ? Column(
                            children: <Widget>[
                              Card(
                                elevation: 20,
                                child: controller.store.nextContactBR != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Próximo contato marcado para : " +
                                              controller.store.nextContactBR,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    color:
                                        AppThemeLight().getTheme().primaryColor,
                                    onPressed: () {
                                      var updateRegister = RegisterModel(
                                          id: widget.contactsModel.id,
                                          idClient:
                                              widget.contactsModel.idClient,
                                          idUser: widget.contactsModel.idUser,
                                          contactFrom:
                                              widget.contactsModel.contactFrom,
                                          dateContact:
                                              widget.contactsModel.dateContact,
                                          observation: widget
                                              .contactsModel.observation ??= "",
                                          reason: widget
                                              .contactsModel.reason ??= "",
                                          status: widget.contactsModel.status,
                                          productAmount: widget
                                              .contactsModel.productAmount,
                                          productId:
                                              widget.contactsModel.productId,
                                          valueSold: double.parse(widget
                                                      .contactsModel.valueSold)
                                                  .toString() ??
                                              '0.0',
                                          nextContact:
                                              controller.store.nextContact);
                                      controller.updateRegister(updateRegister,
                                          widget.contactsModel.id);
                                    },
                                    child: Text('SALVAR E SAIR'),
                                  ),
                                ),
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
