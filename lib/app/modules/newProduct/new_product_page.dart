import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
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
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('lib/assets/images/fillform.png'),
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
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: () {
                        _selectInitalDate(context);
                      },
                      color: AppThemeLight().getTheme().primaryColor,
                      child: Text(
                        'Marcar Data de Início da Campanha',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: controller.store.initialDate != null
                      ? Text(
                          "Data de Início : " + controller.store.initialDateBR,
                          style: TextStyle(fontSize: 16),
                        )
                      : SizedBox()),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: () {
                        _selectFinalDate(context);
                      },
                      color: AppThemeLight().getTheme().primaryColor,
                      child: Text(
                        'Marcar Data Final da Campanha',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: controller.store.finalDate != null
                      ? Text(
                          "Data de Término : " + controller.store.finalDateBR,
                          style: TextStyle(fontSize: 16),
                        )
                      : SizedBox()),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: controller.store.isButtonValid
                          ? () {
                              var product = ProductModel(
                                  productName: controller.store.name,
                                  price: controller.store.price,
                                  initialDate: controller.store.initialDate,
                                  finalDate: controller.store.finalDate);

                              controller.store.repository
                                  .newProduct(product)
                                  .then((value) {
                                controller.store.cleanFields();
                              });
                            }
                          : null,
                      child: Text(
                        "SALVAR",
                        style: TextStyle(fontSize: 20),
                      ),
                      color: AppThemeLight().getTheme().primaryColor,
                    ),
                  )),
              
            ],
          ),
        );
      }),
    );
  }

  Future<Null> _selectInitalDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //locale: Locale('pt'),
        firstDate: DateTime.now().subtract(Duration(days: 1)),
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
        firstDate: DateTime.now().subtract(Duration(days: 1)),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (picked != null) {
      var brDate = formatDate(picked, [dd, '/', mm, '/', yyyy]);
      var usDate = formatDate(picked, [yyyy, '/', mm, '/', dd]);
      controller.store.setFinalDate(usDate);
      controller.store.setFinalDateBR(brDate);
    }
  }
}
