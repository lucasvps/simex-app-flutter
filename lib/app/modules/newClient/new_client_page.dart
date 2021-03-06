import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/core/widgets.dart/components.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/models/store_model.dart';
import 'package:simex_app/app/modules/newClient/widgets/custom_text_field.dart';
import 'package:simex_app/app/modules/newRegister/new_register_page.dart';
import 'new_client_controller.dart';

class NewClientPage extends StatefulWidget {
  final String title;
  const NewClientPage({Key key, this.title = "NewClient"}) : super(key: key);

  @override
  _NewClientPageState createState() => _NewClientPageState();
}

class _NewClientPageState
    extends ModularState<NewClientPage, NewClientController> {
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

  static var maskTextInputFormatterCPF = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  static var maskTextInputFormatterPhone = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Registro de Novo Cliente',
            style: GoogleFonts.montserrat(),
          ),
          centerTitle: true,
        ),
        body: Observer(builder: (context) {
          return SingleChildScrollView(
            child: Card(
              child: Column(
                children: <Widget>[
                  CustomTextField(
                      label: "Nome",
                      error: controller.store.validateName,
                      onChangedFunction: controller.store.setName),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            inputFormatters: [maskTextInputFormatterCPF],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'CPF',
                              errorText: controller.store.validateCPF(),
                            ),
                            onChanged: controller.store.setCPF,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            inputFormatters: [maskTextInputFormatterPhone],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Telefone',
                              errorText: controller.store.validatePhone(),
                            ),
                            onChanged: controller.store.setPhone,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    label: "Endereço",
                    error: controller.store.validateAdress,
                    onChangedFunction: controller.store.setAdress,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          label: "Cidade",
                          error: controller.store.validateCity,
                          onChangedFunction: controller.store.setCity,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          label: "UF",
                          error: controller.store.validateState,
                          onChangedFunction: controller.store.setState,
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: controller.store.storeRepository.getAllStore(),
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
                              child: SingleChildScrollView(
                                  child: dropDownMenu(snapshot.data)),
                            );
                          }
                          break;
                      }
                      return Container();
                    },
                  ),
                  CustomTextFieldOptional(
                    label: "Email",
                    onChangedFunction: controller.store.setEmail,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomTextFieldOptional(
                          label: "Cultura 1",
                          onChangedFunction: controller.store.setCultureOne,
                        ),
                      ),
                      Expanded(
                        child: CustomTextFieldOptional(
                          label: "Cultura 2",
                          onChangedFunction: controller.store.setCultureTwo,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomTextFieldOptional(
                          label: "Qtd de Tratores",
                          onChangedFunction: controller.store.setTotalTractor,
                        ),
                      ),
                      Expanded(
                        child: CustomTextFieldOptional(
                          label: "Qtd de Colheitadeiras",
                          onChangedFunction: controller.store.setTotalCombine,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      child: RaisedButton(
                        onPressed: controller.store.isButtonValid
                            ? () {
                                var newClient = ClientModel(
                                  name: controller.store.name,
                                  adress: controller.store.adress,
                                  city: controller.store.city,
                                  code: '1832187',
                                  cpf: controller.store.cpf,
                                  contactsDone: 0,
                                  cultureOne: controller.store.cultureOne ?? "",
                                  cultureTwo: controller.store.cultureTwo ?? "",
                                  email: controller.store.email ?? "",
                                  phone: controller.store.phone,
                                  lastContact: "",
                                  lastPurchase: "",
                                  state: controller.store.state,
                                  store: controller.store.store,
                                  totalCombine:
                                      controller.store.totalCombine ?? 0,
                                  totalTractor:
                                      controller.store.totalTractor ?? 0,
                                );

                                controller.store
                                    .registerClient(newClient)
                                    .then((value) {
                                  Modular.to.pop();
                                  // clientAlert(
                                  //     context,
                                  //     'ATENÇÃO!',
                                  //     'Deseja realizar um registro com esse cliente?',
                                  //     newClient);
                                }).catchError((err) {
                                  Components.alert(
                                    context,
                                    'Ocorreu algum erro!',
                                    'Por favor, tente novamente!',
                                  );
                                });
                              }
                            : null,
                        child: Text(
                          'REGISTRAR',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: AppThemeLight().getTheme().primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Future clientAlert(context, title, content, ClientModel newClient) {
    print(newClient.toJson());
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              child: Text(content),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Modular.to.pushNamedAndRemoveUntil(
                        '/contacts', ModalRoute.withName('/contacts'));
                  },
                  child: Text("Tela Principal")),
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewRegisterPage(
                                clientModel: newClient,
                              )),
                    );
                  },
                  child: Text("Realizar Registro"))
            ],
          );
        });
  }

  //! ------------------------------------

  // ***********************************************************************************

  Widget dropDownMenu(List<StoreModel> stores) {
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
                    items: stores.map((item) {
                      return DropdownMenuItem(
                        child: Text(
                          item.storeName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        value: item.storeName.toString(),
                      );
                    }).toList(),
                    hint: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Center(
                        child: Text("Loja",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'Indie')),
                      ),
                    ),
                    onChanged: (_) async {
                      controller.store.setStore(_);
                    },
                    icon: Icon(
                      Icons.arrow_downward,
                      size: 20,
                      color: Colors.black,
                    ),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    value: controller.store.store,
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
