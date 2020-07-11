import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simex_app/app/core/themes/light_theme.dart';
import 'package:simex_app/app/models/user_model.dart';
import 'users_controller.dart';

class UsersPage extends StatefulWidget {
  final String title;
  const UsersPage({Key key, this.title = "Users"}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends ModularState<UsersPage, UsersController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 100,
        width: 80,
        child: FloatingActionButton(
          backgroundColor:
              AppThemeLight().getTheme().primaryColor.withOpacity(0.6),
          onPressed: () {
            //Modular.to.pushNamed('/newClient');
          },
          child: Text(
            'Novo Vendedor',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Vendedores'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: SizedBox(
              child: FutureBuilder(
                future: controller.store.userRepository.getUsers(),
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
                        return listView(snapshot.data);
                      }
                      break;
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listView(List<UserModel> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'NOME : ' + users[index].name,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'EMAIL : ' + users[index].email,
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    users[index].isAdmin.toString() == '1'
                        ? "ADMIN : Sim"
                        : "ADMIN : Não",
                    style: GoogleFonts.pangolin(
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 3,
                      child: RaisedButton(
                        onPressed: () {
                          
                        },
                        child: Text(
                          'EDITAR',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 3,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'DELETAR',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
