import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/modules/newRegister/new_register_store.dart';

import 'new_register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'new_register_page.dart';

class NewRegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewRegisterController(i.get())),
        Bind((i) => NewRegisterStore(i.get(), i.get())),
        Bind((i) => RegisterRepository()),
        Bind((i) => ProductRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => NewRegisterPage()),
      ];

  static Inject get to => Inject<NewRegisterModule>.of();
}
