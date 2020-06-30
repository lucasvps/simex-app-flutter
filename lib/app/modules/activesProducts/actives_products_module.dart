import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/modules/activesProducts/actives_products_store.dart';

import 'actives_products_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'actives_products_page.dart';

class ActivesProductsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ActivesProductsController(i.get())),
        Bind((i) => ActivesProductsStore(i.get())),
        Bind((i) => ProductRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ActivesProductsPage()),
      ];

  static Inject get to => Inject<ActivesProductsModule>.of();
}
