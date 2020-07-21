import 'package:simex_app/app/core/repositories/client_repository.dart';
import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/core/repositories/store_repository.dart';
import 'package:simex_app/app/modules/clientsByStore/clients_by_store_store.dart';
import 'package:simex_app/app/modules/newRegister/new_register_controller.dart';
import 'package:simex_app/app/modules/newRegister/new_register_store.dart';

import 'clients_by_store_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'clients_by_store_page.dart';

class ClientsByStoreModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientsByStoreController(i.get(), i.get())),
        Bind((i) => ClientsByStoreStore(i.get())),
        Bind((i) => StoreRepository()),
        Bind((i) => ClientRepository()),
        Bind((i) => NewRegisterController(i.get())),
        Bind((i) => NewRegisterStore(i.get(), i.get())),
        Bind((i) => ProductRepository()),
        Bind((i) => RegisterRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientsByStorePage()),
      ];

  static Inject get to => Inject<ClientsByStoreModule>.of();
}
