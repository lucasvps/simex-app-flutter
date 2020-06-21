import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
            content: new Text('Você pode ter alterações que não foram salvas, você realmente deseja sair?'),
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
          title: Text("Código do cliente : " + widget.detailedClient.code),
          centerTitle: true,
        ),
        body: Container(
          height: double.maxFinite,
          color: Colors.blueGrey[200],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    child: Container(
                        width: double.maxFinite,
                        child: Card(
                          color: Colors.black,
                          child: Text(
                            'INFORMAÇOES PESSOAIS',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  CustomInfoRow(
                    field: 'Nome',
                    readOnly: false,
                    errorText: controller.validateName,
                    value: widget.detailedClient.name,
                    onChanged: controller.infoClientStore.setName,
                  ),
                  CustomInfoRow(
                    readOnly: false,
                    field: 'Telefone',
                    value: widget.detailedClient.phone,
                    onChanged: controller.infoClientStore.setPhone,
                  ),
                  CustomInfoRow(
                    readOnly: false,
                    field: 'Email',
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
                    field: 'Endereço',
                    value: widget.detailedClient.adress,
                    onChanged: controller.infoClientStore.setAdress,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: CustomInfoRow(
                            readOnly: false,
                            field: 'Cidade',
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
                    field: 'Loja',
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
                  Container(
                    width: double.maxFinite,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        int helpTractor;
                        if (controller.infoClientStore.totalTractor == null &&
                            widget.detailedClient.totalTractor == null) {
                          helpTractor = 0;
                        } else if (controller.infoClientStore.totalTractor ==
                                null &&
                            widget.detailedClient.totalTractor != null) {
                          helpTractor = widget.detailedClient.totalTractor;
                        } else if (controller.infoClientStore.totalTractor !=
                            null) {
                          helpTractor = int.parse(
                              controller.infoClientStore.totalTractor);
                        }

                        int helpCombine;
                        if (controller.infoClientStore.totalCombine == null &&
                            widget.detailedClient.totalCombine == null) {
                          helpCombine = 0;
                        } else if (controller.infoClientStore.totalCombine ==
                                null &&
                            widget.detailedClient.totalCombine != null) {
                          helpCombine = widget.detailedClient.totalCombine;
                        } else if (controller.infoClientStore.totalCombine !=
                            null) {
                          helpCombine = int.parse(
                              controller.infoClientStore.totalCombine);
                        }

                        var updateClient = ClientModel(
                          code: widget.detailedClient.code,
                          cpf: widget.detailedClient.cpf,
                          id: widget.detailedClient.id,
                          name: controller.infoClientStore.name ??=
                              widget.detailedClient.name,
                          email: controller.infoClientStore.email ??=
                              widget.detailedClient.email,
                          adress: controller.infoClientStore.adress ??=
                              widget.detailedClient.adress,
                          city: controller.infoClientStore.city ??=
                              widget.detailedClient.city,
                          state: controller.infoClientStore.state ??=
                              widget.detailedClient.state,
                          cultureOne: controller.infoClientStore.cultureOne ??=
                              widget.detailedClient.cultureOne,
                          cultureTwo: controller.infoClientStore.cultureTwo ??=
                              widget.detailedClient.cultureTwo,
                          phone: controller.infoClientStore.phone ??=
                              widget.detailedClient.phone,
                          store: controller.infoClientStore.store ??=
                              widget.detailedClient.store,
                          totalTractor: helpTractor,
                          totalCombine: helpCombine,
                          contactsDone: 14,
                          lastContact: widget.detailedClient.lastContact,
                          lastPurchase: widget.detailedClient.lastPurchase,
                        );

                        controller.infoClientStore.updateClient(
                            widget.detailedClient.id, updateClient);
                        controller.infoClientStore.clearField();
                      },
                      child: Text(
                        'SALVAR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                        width: double.maxFinite,
                        child: Card(
                          color: Colors.black,
                          child: Text(
                            'INFORMAÇOES ADICIONAIS',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  CustomInfoRow(
                    readOnly: true,
                    field: 'Contatos feitos',
                    value: widget.detailedClient.contactsDone.toString(),
                  ),
                  CustomInfoRow(
                      readOnly: true,
                      field: 'Último contato',
                      value: widget.detailedClient.lastContact ?? ""),
                  CustomInfoRow(
                      readOnly: true,
                      field: 'Última compra',
                      value: widget.detailedClient.lastPurchase ?? ""),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
