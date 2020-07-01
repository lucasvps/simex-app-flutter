import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/product_model.dart';
import 'actives_products_controller.dart';

class ActivesProductsPage extends StatefulWidget {
  final String title;
  const ActivesProductsPage({Key key, this.title = "ActivesProducts"})
      : super(key: key);

  @override
  _ActivesProductsPageState createState() => _ActivesProductsPageState();
}

class _ActivesProductsPageState
    extends ModularState<ActivesProductsPage, ActivesProductsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width: 100,
          height: 100,
          child: FloatingActionButton(
            backgroundColor: AppThemeLight().getTheme().primaryColor,
            onPressed: () {
              Modular.to.pushNamed('/newProduct');
            },
            child: Text(
              'Cadastrar nova campanha',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Campanhas Ativas'),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  child: Container(
                    child: FutureBuilder(
                      future: controller.store.repository.currentProducts(),
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
                            return Text('erro 1');
                            break;
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              Modular.to.pushNamedAndRemoveUntil(
                                  '/login', ModalRoute.withName('/home'));
                              //Modular.get<AppController>().authStore.refresh();
                            }
                            if (!snapshot.hasData) {
                              Modular.to.pushNamedAndRemoveUntil(
                                  '/login', ModalRoute.withName('/home'));
                              //Modular.get<AppController>().authStore.refresh();
                            } else {
                              return customList(snapshot.data);
                            }

                            break;
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget customList(List<ProductModel> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: ListTile(
              trailing: Icon(
                Icons.build,
                size: 30,
                color: AppThemeLight().getTheme().primaryColor,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Produto : ' + products[index].productName,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Preço : R\$' + products[index].price,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Data inicial da campanha : ' + products[index].initialDate,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Data final  da campanha : ' + products[index].finalDate,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
