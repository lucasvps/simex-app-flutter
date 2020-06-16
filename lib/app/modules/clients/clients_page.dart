import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'clients_controller.dart';
import 'widgets/custom_list_view.dart';

class ClientsPage extends StatefulWidget {
  final String title;
  const ClientsPage({Key key, this.title = "Clients"}) : super(key: key);

  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends ModularState<ClientsPage, ClientsController> {
  //use 'controller' variable to access controller

  TextEditingController controllerText = TextEditingController();

  @override
  void initState() {
    controllerText.text = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
        centerTitle: true,
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              
              controller: controllerText,
              decoration: InputDecoration(
                suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: (){
                  controller.setSearch(controllerText.text);
                  controllerText.text = '';
                }),
                  labelText: "Pesquisar cliente pelo cpf ou cnpj",
                  border: OutlineInputBorder()),
            ),
          ),
          
          Observer(builder: (_) {
            return FutureBuilder(
              future: controller.searchedUserByDoc(controller.searchDoc),
              builder: (context, snapshot) {
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
                      return Text('');
                    }
                    if (!snapshot.hasData) {
                      return Text('Nenhum Cliente Encontrado!');
                    } else {
                      return CustomListView(clientSearched: snapshot.data,);
                    }
                    break;
                }
              },
            );
          })
        ],
      ),
    );
  }
}
