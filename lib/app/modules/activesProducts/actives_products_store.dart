import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/product_repository.dart';

part 'actives_products_store.g.dart';

class ActivesProductsStore = _ActivesProductsStoreBase with _$ActivesProductsStore;

abstract class _ActivesProductsStoreBase with Store {
  final ProductRepository repository;

  _ActivesProductsStoreBase(this.repository);
}