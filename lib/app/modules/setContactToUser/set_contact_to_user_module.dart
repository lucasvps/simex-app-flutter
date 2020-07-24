import 'package:simex_app/app/core/repositories/client_repository.dart';
import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/core/repositories/store_repository.dart';
import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/modules/clientsByStore/clients_by_store_store.dart';
import 'package:simex_app/app/modules/newRegister/new_register_controller.dart';
import 'package:simex_app/app/modules/newRegister/new_register_store.dart';
import 'package:simex_app/app/modules/setContactToUser/set_contact_to_user_store.dart';

import 'set_contact_to_user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'set_contact_to_user_page.dart';

class SetContactToUserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SetContactToUserController(i.get(), i.get())),
        Bind((i) => NewRegisterController(i.get())),
        Bind((i) => NewRegisterStore(i.get(), i.get())),
        Bind((i) => ProductRepository()),
        Bind((i) => RegisterRepository()),
        Bind((i) => StoreRepository()),
        Bind((i) => SetContactsToUserStore(i.get(), i.get(), i.get())),
        Bind((i) => ClientRepository()),
        Bind((i) => UserRepository()),
        

      ];

  @override
  List<Router> get routers => [
        Router('/',
            child: (_, args) => SetContactToUserPage()),
      ];

  static Inject get to => Inject<SetContactToUserModule>.of();
}
