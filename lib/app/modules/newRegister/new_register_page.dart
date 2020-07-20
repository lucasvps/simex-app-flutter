import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/core/widgets.dart/components.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/models/product_model.dart';
import 'package:simex_app/app/models/register_model.dart';
import 'package:simex_app/app/modules/clients/repositories/client_repository.dart';
import '../../app_controller.dart';
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
                  controller.store.setCurrentStep(0);
                },
                child: new Text('Sair'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    Modular.get<AppController>().authStore.getCurrentUser().then((value) async {
      await controller.store.setCurrentUserID(value['id']);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Novo Registro',
                style: GoogleFonts.montserrat(),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stepper(
                    physics: NeverScrollableScrollPhysics(),
                    onStepTapped: (step) {
                      controller.store.setCurrentStep(step);
                    },
                    onStepContinue: controller.store.currentStep <
                            this._mySteps().length - 1
                        ? () {
                            if (controller.store.currentStep <
                                this._mySteps().length - 1) {
                              controller.store.setCurrentStep(
                                  controller.store.currentStep + 1);
                            } else {}
                          }
                        : null,
                    onStepCancel: () {
                      if (controller.store.currentStep > 0) {
                        controller.store
                            .setCurrentStep(controller.store.currentStep - 1);
                      } else {}
                    },
                    steps: _mySteps(),
                    currentStep: controller.store.currentStep,
                  ),
                ],
              ),
            )),
      );
    });
  }

  // ***********************************************************************************

  Widget statusRadioButton(String value, String text) {
    return Observer(builder: (context) {
      return Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
            ),
            Radio(
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
          ],
        ),
      );
    });
  }

  // ***********************************************************************************

  Widget contactFromRadioButton(String value, String text) {
    return Observer(builder: (context) {
      return Flexible(
          child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
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

  // ***********************************************************************************

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

  // ***********************************************************************************

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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: products.map((item) {
                      return DropdownMenuItem(
                        child: Text(
                          item.productName +
                              " / " +
                              NumberFormat.simpleCurrency(locale: 'pt_Br')
                                  .format(
                                double.parse(item.price),
                              ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: item.id.toString(),
                      );
                    }).toList(),
                    hint: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Center(
                        child: Text("Produtos",
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

  // ***********************************************************************************

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Tipo de contato realizado'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              contactFromRadioButton('Telefone Ativo', 'Telefone Ativo'),
              contactFromRadioButton('Visita Externa', 'Visita Externa'),
              contactFromRadioButton('Telefone Recebido', 'Telefone Recebido'),
              contactFromRadioButton('Balcao', 'Balcao'),
            ],
          ),
        ),
        isActive: controller.store.currentStep >= 0,
      ),
      Step(
        title: Text('Status do Contato Realizado'),
        content: controller.store.contactFrom != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    statusRadioButton('Venda Efetiva', 'Venda Efetiva'),
                    statusRadioButton('Venda Pendente', 'Venda Pendente'),
                  ],
                ),
              )
            : Text('Marque a opção anterior.'),
        isActive: controller.store.currentStep >= 1,
      ),
      Step(
        title: Text('Produto/Campanha'),
        isActive: controller.store.currentStep >= 2,
        content: controller.store.status != null
            ? Column(
                children: <Widget>[
                  controller.store.pendingSell
                      ? Row(
                          children: <Widget>[
                            Checkbox(
                                checkColor:
                                    AppThemeLight().getTheme().primaryColor,
                                value: controller.store.noProduct,
                                onChanged: (value) {
                                  controller.store.changeNoProduct();
                                  if (controller.store.noProduct) {
                                    controller.store.setProdId(null);
                                  }
                                }),
                            Text('Sem produto')
                          ],
                        )
                      : SizedBox(),
                  !controller.store.noProduct
                      ? FutureBuilder(
                          future: controller.store.productRepository
                              .currentProducts(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                                    child: SingleChildScrollView(
                                        child: dropDownMenu(snapshot.data)),
                                  );
                                }
                                break;
                            }
                            return Container();
                          },
                        )
                      : SizedBox(),
                ],
              )
            : Text('Marque a opção anterior.'),
      ),
      Step(
        title: Text(controller.store.status == "Venda Efetiva"
            ? "Quantidade Vendida"
            : "Descrição do contato"),
        isActive: controller.store.currentStep >= 3,
        content:
            (controller.store.productName != null || controller.store.noProduct)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: controller.store.efectiveSell &&
                            controller.store.productPrice != null
                        ? Column(
                            children: <Widget>[
                              TextFormField(
                                onChanged: (value) => controller.store
                                    .setAmountSold(int.parse(value)),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Quantidade Vendida",
                                    border: OutlineInputBorder()),
                              ),
                              Observer(builder: (_) {
                                return Padding(
                                    padding: EdgeInsets.all(8),
                                    child: controller.store.efectiveSell &&
                                            controller.store.amountSold != 0 &&
                                            controller.store.amountSold != null
                                        ? Text(
                                            "Valor da Venda : " +
                                                NumberFormat.simpleCurrency(
                                                        locale: 'pt_Br')
                                                    .format(controller
                                                            .store.amountSold *
                                                        double.parse(controller
                                                            .store
                                                            .productPrice)),
                                            style: TextStyle(fontSize: 20),
                                          )
                                        : SizedBox());
                              }),
                            ],
                          )
                        : TextFormField(
                            onChanged: controller.store.setObservation,
                            maxLines: 3,
                            decoration: InputDecoration(
                                labelText: "Descrição do contato",
                                border: OutlineInputBorder()),
                          ))
                : Text('Marque a opçao anterior.'),
      ),
      Step(
          isActive: controller.store.currentStep >= 4,
          title: Text("Marcar Data Para Próximo Contato"),
          content: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    color: AppThemeLight().getTheme().primaryColor,
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text(
                      'Agendar próximo contato!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Observer(builder: (_) {
                return Card(
                  elevation: 20,
                  child: controller.store.nextContactBR != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Próximo contato marcado para : " +
                                controller.store.nextContactBR,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : SizedBox(),
                );
              }),
            ],
          )),
      Step(
          isActive: controller.store.currentStep >= 5,
          title: Text('Salvar'),
          content: (controller.store.nextContact != null ||
                  (controller.store.amountSold != null &&
                      controller.store.amountSold > 0))
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        color: AppThemeLight().getTheme().primaryColor,
                        onPressed: () {
                          setRegisterModelToCreate();
                        },
                        child: Text(
                          'SALVAR',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                      )),
                )
              : Text('Marque a opção anterior.')),
    ];
    return _steps;
  }
  // AQUI

  // ***********************************************************************************

  setRegisterModelToCreate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);

    print(controller.store.productPrice);

    var registerModel = RegisterModel(
        idClient: widget.clientModel.id,
        idUser: controller.store.currentUserID,
        productId: controller.store.prodID != null
            ? int.parse(controller.store.prodID)
            : null,
        dateContact: formatted,
        nextContact:
            controller.store.pendingSell ? controller.store.nextContact : "",
        observation: controller.store.observation ?? "",
        productAmount: controller.store.amountSold ?? "",
        reason: "",
        status:
            controller.store.efectiveSell ? "Venda Efetiva" : "Venda Pendente",
        valueSold: controller.store.amountSold != null
            ? (double.parse(controller.store.productPrice) *
                    controller.store.amountSold.toDouble())
                .toString()
            : '0.0',
        contactFrom: controller.store.contactFrom);

    var createRegisterModel = RegisterModel(
        idClient: widget.clientModel.id,
        idUser: controller.store.currentUserID,
        productId: null,
        dateContact: formatted,
        nextContact: controller.store.nextContact,
        observation: "",
        productAmount: controller.store.amountSold ?? "",
        reason: "",
        status: "Contato",
        valueSold: '0.0',
        contactFrom: controller.store.contactFrom);

    print(registerModel.toJson());

    controller.store.repository.createRegister(registerModel).then((value) {
      controller.store.setCurrentStep(0);
      controller.store.cleanFields();

      if (controller.store.efectiveSell) {
        controller.store.repository.createRegister(createRegisterModel);
      }

      ClientModel clientModelUpdate = ClientModel(
        adress: widget.clientModel.adress,
        city: widget.clientModel.city,
        code: widget.clientModel.code,
        cpf: widget.clientModel.cpf,
        cultureOne: widget.clientModel.cultureOne,
        cultureTwo: widget.clientModel.cultureTwo,
        email: widget.clientModel.email,
        name: widget.clientModel.name,
        phone: widget.clientModel.phone,
        state: widget.clientModel.state,
        store: widget.clientModel.store,
        totalCombine: widget.clientModel.totalCombine,
        totalTractor: widget.clientModel.totalTractor,
        contactsDone: widget.clientModel.contactsDone + 1,
        lastContact: formatted,
        lastPurchase: controller.store.efectiveSell
            ? formatted
            : widget.clientModel.lastPurchase,
      );

      Modular.get<ClientRepository>()
          .updateClient(widget.clientModel.id, clientModelUpdate)
          .then((value) {})
          .catchError((err) {
        print('erro update' + err);
      });
    }).catchError((err) {
      print('erroooooo : ' + err);
      Components.alert(
        context,
        'Ocorreu algum erro!',
        'Por favor, tente novamente!',
      );
    });
  }
}
