import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/core/widgets.dart/components.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/models/next_contacts_model.dart';
import 'package:simex_app/app/models/register_model.dart';
import 'package:simex_app/app/modules/clients/repositories/client_repository.dart';
import 'updateRegister_controller.dart';

class UpdateRegisterPage extends StatefulWidget {
  final String title;
  const UpdateRegisterPage(
      {Key key, this.title = "UpdateRegister", this.nextContactsModel})
      : super(key: key);

  final NextContactsModel nextContactsModel;

  @override
  _UpdateRegisterPageState createState() => _UpdateRegisterPageState();
}

class _UpdateRegisterPageState
    extends ModularState<UpdateRegisterPage, UpdateRegisterController> {
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Atualização de Registro',
            style: GoogleFonts.montserrat(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Column(
              children: <Widget>[
                Stepper(
                  physics: NeverScrollableScrollPhysics(),
                  onStepTapped: (step) {
                    controller.store.setCurrentStep(step);
                  },
                  onStepContinue:
                      controller.store.currentStep < this._mySteps().length - 1
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
            );
          }),
        ),
      ),
    );
  }

  Widget statusRadioButton(String value, String text) {
    return Observer(
      builder: (_) {
        return Flexible(
          child: Column(
            children: <Widget>[
              Text(
                text,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Radio(
                value: value,
                groupValue: controller.store.status,
                onChanged: (value) {
                  controller.store.setStatus(value);
                  controller.store.setValueSold(0);

                  if (controller.store.status == "Venda Perdida") {
                    controller.store.lostSell = true;
                    controller.store.setObservation('');
                  } else {
                    controller.store.lostSell = false;
                  }

                  if (controller.store.status == "Venda Pendente") {
                    controller.store.pendingSell = true;
                    controller.store.setReason(null);
                    controller.store.setAmountSold(null);
                  } else {
                    controller.store.pendingSell = false;
                  }

                  if (controller.store.status == "Venda Efetiva") {
                    controller.store.efectiveSell = true;
                    controller.store.setReason(null);
                  } else {
                    controller.store.efectiveSell = false;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget reasonRadioButton(String value, String text) {
    return Observer(
      builder: (_) {
        return Flexible(
            child: Column(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
            Radio(
              value: value,
              groupValue: controller.store.reason,
              onChanged: (value) {
                controller.store.setReason(value);
                print(controller.store.reason);
              },
            ),
          ],
        ));
      },
    );
  }

  Widget contactFromRadioButton(String value, String text) {
    return Observer(
      builder: (_) {
        return Flexible(
            child: Column(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
      },
    );
  }

  setRegisterModelToUpdate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);

    var registerModel = RegisterModel(
        id: widget.nextContactsModel.id,
        idClient: widget.nextContactsModel.idClient,
        idUser: widget.nextContactsModel.idUser,
        productId: widget.nextContactsModel.productId,
        dateContact: formatted,
        nextContact:
            controller.store.pendingSell ? controller.store.nextContact : "",
        observation: controller.store.observation ?? "",
        productAmount: controller.store.amountSold ??=
            widget.nextContactsModel.productAmount,
        reason: controller.store.reason ?? "",
        status: controller.store.efectiveSell
            ? "Venda Efetiva"
            : controller.store.pendingSell ? "Venda Pendente" : "Venda Perdida",
        valueSold: controller.store.amountSold != null
            ? (controller.store.amountSold *
                double.parse(widget.nextContactsModel.price)).toString()
            : '0.0',
        contactFrom: controller.store.contactFrom);

    print(registerModel.toJson());
    controller
        .updateRegister(registerModel, widget.nextContactsModel.id)
        .then((value) {
          
      ClientModel clientModelUpdate = ClientModel(
        adress: widget.nextContactsModel.adress,
        city: widget.nextContactsModel.city,
        code: widget.nextContactsModel.code,
        cpf: widget.nextContactsModel.cpf,
        cultureOne: widget.nextContactsModel.cultureOne,
        cultureTwo: widget.nextContactsModel.cultureTwo,
        email: widget.nextContactsModel.email,
        name: widget.nextContactsModel.name,
        phone: widget.nextContactsModel.phone,
        state: widget.nextContactsModel.state,
        store: widget.nextContactsModel.store,
        totalCombine: widget.nextContactsModel.totalCombine,
        totalTractor: widget.nextContactsModel.totalTractor,
        contactsDone: widget.nextContactsModel.contactsDone + 1,
        lastContact: formatted,
        lastPurchase: controller.store.efectiveSell
            ? formatted
            : widget.nextContactsModel.lastPurchase,
      );

      Modular.get<ClientRepository>()
          .updateClient(widget.nextContactsModel.idClient, clientModelUpdate)
          .then((value) {})
          .catchError((err) {
        print('erro update client' + err);
        return err;
      });

      controller.store.cleanFields();
      controller.store.setCurrentStep(0);
    }).catchError((err) {
      print('erro update reg ' + err);
      Components.alert(
        context,
        'Ocorreu algum erro!',
        'Por favor, tente novamente!',
      );
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
                    statusRadioButton('Venda Perdida', 'Venda Perdida'),
                  ],
                ),
              )
            : Text('Marque a opção anterior.'),
        isActive: controller.store.currentStep >= 1,
      ),
      Step(
          title: Text(controller.store.efectiveSell
              ? "Quantidade Vendida"
              : "Observação"),
          isActive: controller.store.currentStep >= 3,
          content: controller.store.status != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.store.efectiveSell
                      ? TextFormField(
                          onChanged: (value) =>
                              controller.store.setAmountSold(int.parse(value)),
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
                        ))
              : Text('Marque a opção anterior.')),
      Step(
          isActive: controller.store.currentStep >= 4,
          title: Text(controller.store.pendingSell
              ? "Marcar Data Para Próximo Contato"
              : controller.store.efectiveSell
                  ? "Valor Final da Venda"
                  : "Motivo da Venda Perdida"),
          content: controller.store.pendingSell
              ? Column(
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
                        child: controller.store.nextContactBR != null &&
                                controller.store.pendingSell
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
                      );
                    }),
                  ],
                )
              : controller.store.efectiveSell &&
                      controller.store.amountSold != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 10, 10),
                      child: Text(
                        "Valor Total da Venda: " +
                            NumberFormat.simpleCurrency(locale: 'pt_Br').format(
                                controller.store.amountSold *
                                    double.parse(
                                        widget.nextContactsModel.price)),
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : controller.store.lostSell
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            reasonRadioButton('Estoque', 'Estoque'),
                            reasonRadioButton('Interesse', 'Interesse'),
                            reasonRadioButton('Preço', 'Preço'),
                          ],
                        )
                      : SizedBox()),
      Step(
        title: Text('Salvar'),
        isActive: controller.store.currentStep >= 5,
        content: (controller.store.reason != null ||
                controller.store.nextContact != null ||
                (controller.store.amountSold != null &&
                    controller.store.amountSold > 0))
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: AppThemeLight().getTheme().primaryColor,
                    onPressed: () {
                      setRegisterModelToUpdate();
                    },
                    child: Text(
                      'SALVAR',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : Text('Marque a opção anterior.'),
      )
    ];
    return _steps;
  }
}
