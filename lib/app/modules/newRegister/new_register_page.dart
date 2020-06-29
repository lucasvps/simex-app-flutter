import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/models/product_model.dart';
import 'package:simex_app/app/models/register_model.dart';
import '../../app_controller.dart';
import 'new_register_controller.dart';

class NewRegisterPage extends StatefulWidget {
  final String title;
  const NewRegisterPage(
      {Key key, this.title = "NewRegister", this.clientModel, this.idClient})
      : super(key: key);
  final ClientModel clientModel;
  final String idClient;

  @override
  _NewRegisterPageState createState() => _NewRegisterPageState();
}

class _NewRegisterPageState
    extends ModularState<NewRegisterPage, NewRegisterController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    Modular.get<AppController>().authStore.getCurrentUser().then((value) async {
      await controller.store.setCurrentUserID(value['id']);
      print(controller.store.currentUserID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Novo Registro'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Text('Cliente : ' + widget.clientModel.name),
              SizedBox(
                height: 10,
              ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    contactFromRadioButton('Telefone Ativo', 'Telefone Ativo'),
                    contactFromRadioButton('Visita Externa', 'Visita Externa'),
                    contactFromRadioButton(
                        'Telefone Recebido', 'Telefone Recebido'),
                    contactFromRadioButton('Balcao', 'Balcao'),
                  ],
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    statusRadioButton('Venda Efetiva', 'Venda Efetiva'),
                    statusRadioButton('Venda Pendente', 'Venda Pendente'),
                  ],
                ),
              ),
              Center(
                  child: Container(
                color: Colors.black,
                width: double.maxFinite,
                child: Text(
                  'Produto e Quantidade',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: controller.store.productRepository.getProducts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.none:
                        return Text("No connection has been made");
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        if (!snapshot.hasData) {
                          return Text("No data");
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                dropDownMenu(snapshot.data),
                              ],
                            ),
                          );
                        }
                        break;
                    }
                    return Container();
                  },
                ),
              ),

              Observer(builder: (context) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: controller.store.efectiveSell &&
                            controller.store.productPrice != null
                        ? TextFormField(
                            onChanged: (value) => controller.store
                                .setAmountSold(int.parse(value)),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Quantidade Vendida",
                                border: OutlineInputBorder()),
                          )
                        : TextFormField(
                            onChanged: controller.store.setObservation,
                            maxLines: 3,
                            decoration: InputDecoration(
                                labelText: "Observação",
                                border: OutlineInputBorder()),
                          ));
              }),

              Observer(builder: (_) {
                return Padding(
                    padding: EdgeInsets.all(8),
                    child: controller.store.efectiveSell &&
                            controller.store.amountSold != 0 &&
                            controller.store.amountSold != null
                        ? Text(
                            "Valor final da Venda : R\$" +
                                (controller.store.amountSold *
                                        double.parse(
                                            controller.store.productPrice))
                                    .toString(),
                            style: TextStyle(fontSize: 20),
                          )
                        : SizedBox());
              }),

              Observer(builder: (_) {
                return controller.store.pendingSell
                    ? Container(
                        width: double.maxFinite,
                        child: RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            _selectDate(context);
                          },
                          child: Text('Agendar próximo contato!'),
                        ),
                      )
                    : SizedBox();
              }),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return Container(
                  child: controller.store.nextContactBR != null &&
                          controller.store.pendingSell
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Próximo contato marcado para : " +
                                controller.store.nextContactBR,
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : SizedBox(),
                );
              }),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      //print(controller.store.amountSold);
                      //print(controller.store.productPrice);
                      setRegisterModelToCreate();
                    },
                    child: Text('SALVAR'),
                  ))
            ],
          ),
        ));
  }

  Widget statusRadioButton(String value, String text) {
    return Observer(builder: (context) {
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
              controller.store.setValueSold('0');

              if (controller.store.status == "Venda Pendente") {
                controller.store.pendingSell = true;
                controller.store.setAmountSold(0);
              } else {
                controller.store.pendingSell = false;
              }

              if (controller.store.status == "Venda Efetiva") {
                controller.store.efectiveSell = true;
              } else {
                controller.store.efectiveSell = false;
              }
            },
          ),
        ),
      );
    });
  }

  Widget contactFromRadioButton(String value, String text) {
    return Observer(builder: (context) {
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
    });
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

  Widget dropDownMenu(List<ProductModel> products) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: products.map((item) {
                      return DropdownMenuItem(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Text(
                            item.productName + " / Valor : R\$" + item.price,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        value: item.id.toString(),
                      );
                    }).toList(),
                    hint: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Center(
                        child: Text("Lista de Produtos/Campanhas",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'Indie')),
                      ),
                    ),
                    onChanged: (_) async {
                      controller.store.setProdId(_);
                      String name = await controller.store.productRepository
                          .getProductName(_);
                      String price = await controller.store.productRepository
                          .getProductPrice(_);
                      controller.store.setProductName(name);
                      controller.store.setProductPrice(price);
                    },
                    icon: Icon(
                      Icons.arrow_downward,
                      size: 20,
                      color: Colors.black,
                    ),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    value: controller.store.prodID,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  setRegisterModelToCreate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);

    print('amount ' + controller.store.amountSold.toString());

    var registerModel = RegisterModel(
        idClient: int.parse(widget.idClient),
        idUser: controller.store.currentUserID,
        productId: int.parse(controller.store.prodID),
        dateContact: formatted,
        nextContact:
            controller.store.pendingSell ? controller.store.nextContact : "",
        observation: controller.store.observation ?? "",
        productAmount: controller.store.amountSold ?? "",
        reason: "",
        status:
            controller.store.efectiveSell ? "Venda Efetiva" : "Venda Pendente",
        valueSold: controller.store.amountSold != null
            ? (double.parse(controller.store.productPrice) * controller.store.amountSold.toDouble())
                .toString()
            : '0.0',
        contactFrom: controller.store.contactFrom);

    print(registerModel.toJson());
    controller.store.repository.createRegister(registerModel);
  }
}
