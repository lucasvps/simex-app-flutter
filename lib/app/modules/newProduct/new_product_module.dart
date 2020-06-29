import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/modules/newProduct/new_product_store.dart';

import 'new_product_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'new_product_page.dart';

class NewProductModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewProductController(i.get())),
        Bind((i) => NewProductStore(i.get())),
        Bind((i) => ProductRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => NewProductPage()),
      ];

  static Inject get to => Inject<NewProductModule>.of();
}
