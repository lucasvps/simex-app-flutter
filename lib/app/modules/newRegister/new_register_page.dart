import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/models/product_model.dart';
import 'new_register_controller.dart';

class NewRegisterPage extends StatefulWidget {
  final String title;
  const NewRegisterPage({Key key, this.title = "NewRegister", this.clientModel})
      : super(key: key);
  final ClientModel clientModel;

  @override
  _NewRegisterPageState createState() => _NewRegisterPageState();
}

class _NewRegisterPageState
    extends ModularState<NewRegisterPage, NewRegisterController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                            controller.store.amountSold != null
                        ? Text(
                            "Valor final da Venda : R\$" +
                                (controller.store.amountSold.toDouble() *
                                        double.parse(
                                            controller.store.productPrice))
                                    .toString(),
                            style: TextStyle(fontSize: 20),
                          )
                        : SizedBox());
              })
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
              controller.store.setValueSold(0);

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
}
