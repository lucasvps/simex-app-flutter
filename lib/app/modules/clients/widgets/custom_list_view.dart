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
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  'Nome : ' +
                                      widget.clientSearched[index].name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  'CPF : ' +
                                      widget.clientSearched[index].cpf,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "Endereço : " +
                                      widget.clientSearched[index].adress,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "Cidade/UF : " +
                                      widget.clientSearched[index].city +
                                      "/" +
                                      widget.clientSearched[index].state,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Expanded(
                              child: ButtonTheme(
                                minWidth:
                                    MediaQuery.of(context).size.width *
                                        0.40,
                                child: RaisedButton(
                                  onPressed: () {
                                    //print('${widget.clientSearched[index].id}');
                                    Modular.to.pushNamed(
                                        '/newRegister/${widget.clientSearched[index].id}');
                                  },
                                  child: Text(
                                    'NOVO REGISTRO',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(0xff0D47A1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: ButtonTheme(
                                minWidth:
                                    MediaQuery.of(context).size.width *
                                        0.40,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InfoClientPage(
                                                  detailedClient:
                                                      widget.clientSearched[
                                                          index])),
                                    );
                                  },
                                  child: Text(
                                    'VER MAIS',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(0xff0D47A1),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
