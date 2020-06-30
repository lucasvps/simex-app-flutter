import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:simex_app/app/models/product_model.dart';
import 'new_product_controller.dart';

class NewProductPage extends StatefulWidget {
  final String title;
  const NewProductPage({Key key, this.title = "NewProduct"}) : super(key: key);

  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState
    extends ModularState<NewProductPage, NewProductController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Produto'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: controller.store.setProductName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorText: controller.store.validateProdName(),
                    labelText: "Nome",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: controller.store.setProductPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    errorText: controller.store.validateProdPrice(),
                    labelText: "Preço",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    onPressed: () {
                      _selectInitalDate(context);
                    },
                    color: Colors.blue,
                    child: Text('Marcar Data de Início da Campanha'),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(8),
                child: controller.store.initialDate != null
                    ? Text("Data de Início : " + controller.store.initialDateBR)
                    : SizedBox()),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    onPressed: () {
                      _selectFinalDate(context);
                    },
                    color: Colors.blue,
                    child: Text('Marcar Data Final da Campanha'),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(8),
                child: controller.store.finalDate != null
                    ? Text("Data de Término : " + controller.store.finalDateBR)
                    : SizedBox()),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: RaisedButton(
                    onPressed: controller.store.isButtonValid
                        ? () {
                            var product = ProductModel(
                                productName: controller.store.name,
                                price: controller.store.price,
                                initialDate: controller.store.initialDate,
                                finalDate: controller.store.finalDate);

                            controller.store.repository.newProduct(product).then((value){
                              controller.store.cleanFields();
                            });
                            
                          }
                        : null,
                    child: Text("SALVAR"),
                    color: Colors.blue,
                  ),
                )),
          ],
        );
      }),
    );
  }

  Future<Null> _selectInitalDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //locale: Locale('pt'),
        firstDate:  DateTime.now().subtract(Duration(days: 1)),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (picked != null) {
      var brDate = formatDate(picked, [dd, '/', mm, '/', yyyy]);
      var usDate = formatDate(picked, [yyyy, '/', mm, '/', dd]);
      controller.store.setInitialDate(usDate);
      controller.store.setInitialDateBR(brDate);
    }
  }

  Future<Null> _selectFinalDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        
        //locale: Locale('pt'),
        firstDate:  DateTime.now().subtract(Duration(days: 1)),
        lastDate: DateTime.now().add(Duration(days: 365)));
  
    if (picked != null) {
      var brDate = formatDate(picked, [dd, '/', mm, '/', yyyy]);
      var usDate = formatDate(picked, [yyyy, '/', mm, '/', dd]);
      controller.store.setFinalDate(usDate);
      controller.store.setFinalDateBR(brDate);
    }
  }
}
