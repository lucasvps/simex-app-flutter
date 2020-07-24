import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simex_app/app/core/stores/auth_store.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Drawer(
          child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            Modular.get<AuthStore>().userName,
            style: GoogleFonts.pangolin(
              fontSize: 18,
            ),
          ),
          accountEmail: Text(
            Modular.get<AuthStore>().userEmail,
            style: GoogleFonts.yanoneKaffeesatz(
              fontSize: 18,
            ),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.black,
          ),
        ),
        customListTile(
            icon: Icons.people,
            title: 'Clientes',
            subtitle: 'Buscar clientes por nome ou registrar novo cliente.',
            pageTo: '/clients'),
        customListTile(
            icon: Icons.search,
            title: 'Clientes',
            subtitle: 'Buscar clientes por loja e por ano de última compra.',
            pageTo: '/clientsByStore'),
        customListTile(
            icon: Icons.folder,
            title: 'Registros',
            subtitle: 'Todos os registros feitos.',
            pageTo: '/registersDone'),
        customListTile(
            icon: Icons.build,
            title: 'Produtos/Campanha',
            subtitle: 'Ver e adicionar produtos/campanhas.',
            pageTo: '/activesProduct'),
        customListTile(
            icon: Icons.print,
            title: 'Relatórios',
            subtitle: "Gerar Relatórios e PDF's.",
            pageTo: '/reports'),
        Modular.get<AuthStore>().isAdmin == 1
            ? customListTile(
                icon: Icons.person_add,
                title: 'Vendedores',
                subtitle: "Cadastrar e ver lista de vendedores.",
                pageTo: '/users')
            : SizedBox(),
        Modular.get<AuthStore>().isAdmin == 1
            ? customListTile(
                icon: Icons.info,
                title: 'Contatos por Vendedor',
                subtitle: "Calendário e histórico de um vendedor.",
                pageTo: '/contactsByUser')
            : SizedBox(),
        Modular.get<AuthStore>().isAdmin == 1
            ? customListTile(
                icon: Icons.schedule,
                title: 'Agendar Contatos',
                subtitle: "Agendar contatos para vendedores.",
                pageTo: '/setContactToUser')
            : SizedBox()
      ]));
    });
  }

  Widget customListTile(
      {String title, String subtitle, String pageTo, IconData icon}) {
    return Card(
      color: Color(0xffFFF176).withOpacity(0.9),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: GoogleFonts.yanoneKaffeesatz(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.yanoneKaffeesatz(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Modular.to.pushNamed(pageTo);
        },
      ),
    );
  }
}
