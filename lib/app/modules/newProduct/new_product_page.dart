import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: controller.store.setProductName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: controller.store.validateProdName(),
                    labelText: "Nome", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: controller.store.setProductPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: controller.store.validateProdPrice(),
                    labelText: "Preço", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: controller.store.setInitialDate,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  errorText: controller.store.validateInitialDate(),
                    labelText: "Data Inicial", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: controller.store.setFinalDate,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  errorText: controller.store.validateFinalDate(),
                    labelText: "Data Final", border: OutlineInputBorder()),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: (){
                    controller.store.repository.currentProducts();
                  },
                  // onPressed: controller.store.isButtonValid
                  //     ? () {
                  //         var product = ProductModel(
                  //             productName: controller.store.name,
                  //             price: controller.store.price,
                  //             initialDate: controller.store.initialDate,
                  //             finalDate: controller.store.finalDate);

                  //         controller.store.repository.newProduct(product);
                  //       }
                  //     : null,
                  child: Text("SALVAR"),
                  color: Colors.blue,
                )),
          ],
        );
      }),
    );
  }
}
