import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/activesProducts/actives_products_store.dart';

part 'actives_products_controller.g.dart';

class ActivesProductsController = _ActivesProductsControllerBase
    with _$ActivesProductsController;

abstract class _ActivesProductsControllerBase with Store {
  final ActivesProductsStore store;

  _ActivesProductsControllerBase(this.store);
}
