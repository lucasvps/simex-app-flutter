import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_page.dart';

class CustomListView extends StatefulWidget {
  CustomListView({Key key, this.clientSearched}) : super(key: key);
  final List<ClientModel> clientSearched;

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemCount: widget.clientSearched.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey[200],
                child: Center(
                  child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Nome : ' + widget.clientSearched[index].name,
                            ),
                            Text(
                              'CPF : ' + widget.clientSearched[index].cpf,
                            ),
                          ],
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Endereço : " +
                                  widget.clientSearched[index].adress,
                            ),
                            Text(
                              "Cidade/UF : " +
                                  widget.clientSearched[index].city +
                                  "/" +
                                  widget.clientSearched[index].state,
                            ),
                          ],
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                //print('${widget.clientSearched[index].id}');
                                Modular.to.pushNamed('/newRegister/${widget.clientSearched[index].id}');
                              },
                              child: Text(
                                'NOVO\nREGISTRO',
                                textAlign: TextAlign.center,
                              ),
                              color: Colors.orangeAccent),
                          SizedBox(
                            width: 10,
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InfoClientPage(detailedClient: widget.clientSearched[index])),
                                );
                              },
                              child: Text('VER MAIS'),
                              color: Colors.blue),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
