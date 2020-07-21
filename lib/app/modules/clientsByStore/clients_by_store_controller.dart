import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/store_repository.dart';
import 'package:simex_app/app/modules/clientsByStore/clients_by_store_store.dart';

part 'clients_by_store_controller.g.dart';

class ClientsByStoreController = _ClientsByStoreControllerBase
    with _$ClientsByStoreController;

abstract class _ClientsByStoreControllerBase with Store {
  final ClientsByStoreStore store;
  final StoreRepository storeRepository;
  

  _ClientsByStoreControllerBase(this.store, this.storeRepository);

  
}
