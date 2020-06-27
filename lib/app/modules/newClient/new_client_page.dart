import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/modules/newClient/widgets/custom_text_field.dart';
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

  static var maskTextInputFormatterCPF = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  static var maskTextInputFormatterPhone = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Novo Cliente'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
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
              CustomTextField(
                label: "Loja",
                error: controller.store.validateStore,
                onChangedFunction: controller.store.setStore,
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
                              contactsDone: 1,
                              cultureOne: controller.store.cultureOne ?? "",
                              cultureTwo: controller.store.cultureTwo ?? "",
                              email: controller.store.email ?? "",
                              phone: controller.store.phone,
                              lastContact: "",
                              lastPurchase: "",
                              state: controller.store.state,
                              store: controller.store.store,
                              totalCombine: controller.store.totalCombine ?? 0,
                              totalTractor: controller.store.totalTractor ?? 0,
                            );

                            controller.store.registerClient(newClient);
                          }
                        : null,
                    child: Text('REGISTRAR'),
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
