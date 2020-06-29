import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/newProduct/new_product_store.dart';

part 'new_product_controller.g.dart';

class NewProductController = _NewProductControllerBase
    with _$NewProductController;

abstract class _NewProductControllerBase with Store {
  final NewProductStore store;

  _NewProductControllerBase(this.store);
}
