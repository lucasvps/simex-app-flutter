import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/modules/clients/clients_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/clients/clients_page.dart';
import 'package:simex_app/app/modules/clients/clients_store.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_controller.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_page.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_store.dart';
import 'package:simex_app/app/modules/newRegister/new_register_controller.dart';
import 'package:simex_app/app/modules/newRegister/new_register_store.dart';

import 'repositories/client_repository.dart';

class ClientsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientsController(i.get())),
        Bind((i) => ClientStore(i.get())),
        Bind((i) => ClientRepository()),
        Bind((i) => InfoClientController(i.get())),
        Bind((i) => InfoClientStore(i.get())),
        Bind((i) => NewRegisterController(i.get())),
        Bind((i) => NewRegisterStore(i.get(), i.get())),
        Bind((i) => ProductRepository()),
        Bind((i) => RegisterRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientsPage()),
        Router('/info', child: (_, args) => InfoClientPage()),
      ];

  static Inject get to => Inject<ClientsModule>.of();
}
