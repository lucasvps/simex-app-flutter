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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                CustomInfoRow(
                    readOnly: false,
                    field: 'Cidade/UF',
                    value: widget.detailedClient.city +
                        "/" +
                        widget.detailedClient.state),
                CustomInfoRow(
                  readOnly: false,
                  field: 'Loja',
                  value: widget.detailedClient.store,
                  onChanged: controller.infoClientStore.setStore,
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'Cultura 1',
                  value: widget.detailedClient.cultureOne,
                  onChanged: controller.infoClientStore.setCultureOne,
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'Cultura 2',
                  value: widget.detailedClient.cultureTwo,
                  onChanged: controller.infoClientStore.setCultureTwo,
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'Quantidade de Trator',
                  value: widget.detailedClient.totalTractor.toString(),
                  onChanged: controller.infoClientStore.setTotalTractor,
                ),
                CustomInfoRow(
                  readOnly: false,
                  field: 'Quantidade de Colheitadeira',
                  value: widget.detailedClient.totalCombine.toString(),
                  onChanged: controller.infoClientStore.setTotalCombine,
                ),
                Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      var updateClient = ClientModel(
                        name: controller.infoClientStore.name,
                        email: controller.infoClientStore.email,
                        adress: controller.infoClientStore.adress,
                        city: controller.infoClientStore.city,
                        cultureOne: controller.infoClientStore.cultureOne,
                        cultureTwo: controller.infoClientStore.cultureTwo,
                        phone: controller.infoClientStore.phone,
                        store: controller.infoClientStore.store,
                        totalTractor: int.parse(controller.infoClientStore.totalTractor),
                        totalCombine: int.parse(controller.infoClientStore.totalCombine)
                      );

                      print(updateClient.toJson().toString());

                      controller.infoClientStore.updateClient(widget.detailedClient.id, updateClient);
                    },
                    child: Text(
                      'SALVAR',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  field: 'Total de contatos feitos',
                  value: widget.detailedClient.contactsDone.toString(),
                  onChanged: controller.infoClientStore.setContactsDone,
                ),
                CustomInfoRow(
                    readOnly: true,
                    field: 'Último contato',
                    value: widget.detailedClient.lastContact),
                CustomInfoRow(
                    readOnly: true,
                    field: 'Última compra',
                    value: widget.detailedClient.lastPurchase),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
