import 'package:simex_app/app/modules/clients/clients_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/clients/clients_page.dart';

import 'repositories/client_repository.dart';

class ClientsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientsController(i.get())),
        Bind((i) => ClientRepository())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientsPage()),
      ];

  static Inject get to => Inject<ClientsModule>.of();
}
