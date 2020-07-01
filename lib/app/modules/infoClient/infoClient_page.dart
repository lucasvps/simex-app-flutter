import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'infoClient_controller.dart';
import 'widgets.dart/custom_info_row.dart';

class InfoClientPage extends StatefulWidget {
  const InfoClientPage({Key key, this.detailedClient}) : super(key: key);
  final ClientModel detailedClient;

  @override
  _InfoClientPageState createState() => _InfoClientPageState();
}

class _InfoClientPageState
    extends ModularState<InfoClientPage, InfoClientController> {
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
                onPressed: () => Navigator.of(context).pop(true),
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
          title: Text("Código do cliente : " + widget.detailedClient.code, style: GoogleFonts.montserrat(),),
          centerTitle: true,
        ),
        body: Container(
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('lib/assets/images/profile.png'),
                    )),
                  ),
                ),

                CustomInfoRow(
                  field: 'NOME',
                  readOnly: false,
                  errorText: controller.validateName,
                  value: widget.detailedClient.name,
                  onChanged: controller.infoClientStore.setName,
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'TELEFONE',
                  value: widget.detailedClient.phone,
                  onChanged: controller.infoClientStore.setPhone,
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'EMAIL',
                  value: widget.detailedClient.email,
                  onChanged: controller.infoClientStore.setEmail,
                ),
                CustomInfoRow(
                  readOnly: true,
                  field: 'CPF',
                  value: widget.detailedClient.cpf,
                  onChanged: controller.infoClientStore.setCPF,
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'ENDEREÇO',
                  value: widget.detailedClient.adress,
                  onChanged: controller.infoClientStore.setAdress,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: CustomInfoRow(
                          readOnly: false,
                          field: 'CIDADE',
                          value: widget.detailedClient.city),
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomInfoRow(
                          readOnly: false,
                          field: 'UF',
                          value: widget.detailedClient.state),
                    ),
                  ],
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'LOJA',
                  value: widget.detailedClient.store,
                  onChanged: controller.infoClientStore.setStore,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: CustomInfoRow(
                        readOnly: false,
                        field: 'Cultura 1',
                        value: widget.detailedClient.cultureOne ?? "",
                        onChanged: controller.infoClientStore.setCultureOne,
                      ),
                    ),
                    Flexible(
                      child: CustomInfoRow(
                        readOnly: false,
                        field: 'Cultura 2',
                        value: widget.detailedClient.cultureTwo ?? "",
                        onChanged: controller.infoClientStore.setCultureTwo,
                      ),
                    ),
                  ],
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'Qtd. de Trator',
                  value: widget.detailedClient.totalTractor.toString(),
                  onChanged: controller.infoClientStore.setTotalTractor,
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'Qtd. de Colheitadeira',
                  value: widget.detailedClient.totalCombine.toString(),
                  onChanged: controller.infoClientStore.setTotalCombine,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: AppThemeLight().getTheme().primaryColor,
                      onPressed: () {
                        updateClient();
                      },
                      child: Text(
                        'SALVAR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, bottom: 10),
                //   child: Container(
                //       width: double.maxFinite,
                //       child: Card(
                //         color: Color(0xffFFF176).withOpacity(0.9),
                //         child: Text(
                //           'INFORMAÇOES ADICIONAIS',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                //         ),
                //       )),
                // ),
                // CustomInfoRow(
                //   readOnly: true,
                //   field: 'Contatos feitos',
                //   value: widget.detailedClient.contactsDone.toString(),
                // ),
                // CustomInfoRow(
                //     readOnly: true,
                //     field: 'Último contato',
                //     value: widget.detailedClient.lastContact ?? ""),
                // CustomInfoRow(
                //     readOnly: true,
                //     field: 'Última compra',
                //     value: widget.detailedClient.lastPurchase ?? ""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateClient() {
    int helpTractor;
    if (controller.infoClientStore.totalTractor == null &&
        widget.detailedClient.totalTractor == null) {
      helpTractor = 0;
    } else if (controller.infoClientStore.totalTractor == null &&
        widget.detailedClient.totalTractor != null) {
      helpTractor = widget.detailedClient.totalTractor;
    } else if (controller.infoClientStore.totalTractor != null) {
      helpTractor = int.parse(controller.infoClientStore.totalTractor);
    }

    int helpCombine;
    if (controller.infoClientStore.totalCombine == null &&
        widget.detailedClient.totalCombine == null) {
      helpCombine = 0;
    } else if (controller.infoClientStore.totalCombine == null &&
        widget.detailedClient.totalCombine != null) {
      helpCombine = widget.detailedClient.totalCombine;
    } else if (controller.infoClientStore.totalCombine != null) {
      helpCombine = int.parse(controller.infoClientStore.totalCombine);
    }

    var updateClient = ClientModel(
      code: widget.detailedClient.code,
      cpf: widget.detailedClient.cpf,
      id: widget.detailedClient.id,
      name: controller.infoClientStore.name ??= widget.detailedClient.name,
      email: controller.infoClientStore.email ??= widget.detailedClient.email,
      adress: controller.infoClientStore.adress ??=
          widget.detailedClient.adress,
      city: controller.infoClientStore.city ??= widget.detailedClient.city,
      state: controller.infoClientStore.state ??= widget.detailedClient.state,
      cultureOne: controller.infoClientStore.cultureOne ??=
          widget.detailedClient.cultureOne,
      cultureTwo: controller.infoClientStore.cultureTwo ??=
          widget.detailedClient.cultureTwo,
      phone: controller.infoClientStore.phone ??= widget.detailedClient.phone,
      store: controller.infoClientStore.store ??= widget.detailedClient.store,
      totalTractor: helpTractor,
      totalCombine: helpCombine,
      contactsDone: widget.detailedClient.contactsDone ??= 0,
      lastContact: widget.detailedClient.lastContact,
      lastPurchase: widget.detailedClient.lastPurchase,
    );

    controller.infoClientStore
        .updateClient(widget.detailedClient.id, updateClient);
    controller.infoClientStore.clearField();
  }
}
