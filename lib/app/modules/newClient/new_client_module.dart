import 'package:simex_app/app/core/repositories/store_repository.dart';
import 'package:simex_app/app/core/repositories/client_repository.dart';
import 'package:simex_app/app/modules/newClient/new_client_store.dart';

import 'new_client_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'new_client_page.dart';

class NewClientModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewClientController(i.get())),
        Bind((i) => NewClientStore(i.get(), i.get())),
        Bind((i) => ClientRepository()),
        Bind((i) => StoreRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => NewClientPage()),
      ];

  static Inject get to => Inject<NewClientModule>.of();
}
