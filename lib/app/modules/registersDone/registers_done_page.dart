import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/models/registers_done_model.dart';
import 'registers_done_controller.dart';

class RegistersDonePage extends StatefulWidget {
  final String title;
  const RegistersDonePage({Key key, this.title = "RegistersDone"})
      : super(key: key);

  @override
  _RegistersDonePageState createState() => _RegistersDonePageState();
}

class _RegistersDonePageState
    extends ModularState<RegistersDonePage, RegistersDoneController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Seu histórico de registros feitos'),
          centerTitle: true,
        ),
        body: Container(
          child: FutureBuilder(
            future: controller.store.registerRepository.registersDoneByUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
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
        ));
  }

  Widget customList(List<RegistersDone> registers) {
    return ListView.builder(
        itemCount: registers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.toys,
                color: Colors.green,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Cliente : ' + registers[index].name),
                  Text('Status : ' + registers[index].status),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Data de Contato : ' + registers[index].dateContact),
                ],
              ),
            ),
          );
        });
  }
}
