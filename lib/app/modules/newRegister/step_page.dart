import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/newRegister/new_register_controller.dart';

class StepTeste extends StatefulWidget {
  StepTeste({Key key}) : super(key: key);

  @override
  _StepTesteState createState() => _StepTesteState();
}

class _StepTesteState extends State<StepTeste> {
  //int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stepper(
            onStepTapped: (step) {
              Modular.get<NewRegisterController>().store.setCurrentStep(step);
            },
            onStepContinue: Modular.get<NewRegisterController>().store.contactFrom != null ? () {
              if (Modular.get<NewRegisterController>().store.currentStep <
                  this._mySteps().length - 1) {
                Modular.get<NewRegisterController>().store.setCurrentStep(
                    Modular.get<NewRegisterController>().store.currentStep + 1);
              } else {
                print('completed');
              }
            } : null,

            onStepCancel: () {
              if (Modular.get<NewRegisterController>().store.currentStep > 0) {
                Modular.get<NewRegisterController>().store.setCurrentStep(
                    Modular.get<NewRegisterController>().store.currentStep - 1);
              } else {
                print('completed');
              }
            } ,
            steps: _mySteps(),
            currentStep: Modular.get<NewRegisterController>().store.currentStep,
          ),
        ),
      );
    });
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
        isActive: Modular.get<NewRegisterController>().store.currentStep >= 0,
      ),
      Step(
        title: Text('Status do Contato Realizado'),
        content: Modular.get<NewRegisterController>().store.contactFrom != null ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              statusRadioButton('Venda Efetiva', 'Venda Efetiva'),
              statusRadioButton('Venda Pendente', 'Venda Pendente'),
            ],
          ),
        ) : Text('MARQUE A OPÇÃO ANTERIOR', textAlign: TextAlign.left,),
        isActive: Modular.get<NewRegisterController>().store.currentStep >= 1,
      ),
    ];
    return _steps;
  }

  Widget contactFromRadioButton(String value, String text) {
    return Flexible(
        child: Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Radio(
          value: value,
          groupValue: Modular.get<NewRegisterController>().store.contactFrom,
          onChanged: (value) {
            Modular.get<NewRegisterController>().store.setContactFrom(value);
            print(Modular.get<NewRegisterController>().store.contactFrom);
          },
        ),
      ],
    ));
  }

  Widget statusRadioButton(String value, String text) {
    return Observer(builder: (context) {
      return Flexible(
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          leading: Radio(
            value: value,
            groupValue: Modular.get<NewRegisterController>().store.status,
            onChanged: (value) {
              Modular.get<NewRegisterController>().store.setStatus(value);
              Modular.get<NewRegisterController>().store.setValueSold('0');

              if (Modular.get<NewRegisterController>().store.status ==
                  "Venda Pendente") {
                Modular.get<NewRegisterController>().store.pendingSell = true;
                Modular.get<NewRegisterController>().store.setAmountSold(0);
              } else {
                Modular.get<NewRegisterController>().store.pendingSell = false;
              }

              if (Modular.get<NewRegisterController>().store.status ==
                  "Venda Efetiva") {
                Modular.get<NewRegisterController>().store.efectiveSell = true;
              } else {
                Modular.get<NewRegisterController>().store.efectiveSell = false;
              }
            },
          ),
        ),
      );
    });
  }
}
