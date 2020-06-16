import 'package:flutter/material.dart';
import 'package:simex_app/app/models/client_model.dart';

class CustomListView extends StatefulWidget {
  CustomListView({Key key, this.clientSearched}) : super(key: key);
  final ClientModel clientSearched;

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey[200],
                child: Center(
                  child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                        child: Text(
                          'Nome : ' + widget.clientSearched.name,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                        child: Text(
                          "CPF/CNPJ : " + widget.clientSearched.cpf,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {},
                              child: Text('NOVO\nREGISTRO', textAlign: TextAlign.center,),
                              color: Colors.orangeAccent),
                          SizedBox(
                            width: 10,
                          ),
                          FlatButton(
                              onPressed: () {},
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
