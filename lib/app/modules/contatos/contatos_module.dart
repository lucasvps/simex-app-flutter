import 'package:simex_app/app/modules/contatos/contatos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/contatos/contatos_page.dart';
import 'package:simex_app/app/modules/contatos/repositories/contacts_repository.dart';
import 'package:simex_app/app/modules/registerInfo/registerInfo_controller.dart';

class ContatosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ContatosController(i.get())),
        Bind((i) => ContactsRepository()),
        Bind((i) => RegisterInfoController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ContatosPage()),
      ];

  static Inject get to => Inject<ContatosModule>.of();
}
