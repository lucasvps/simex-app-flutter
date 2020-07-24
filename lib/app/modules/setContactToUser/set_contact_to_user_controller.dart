import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/store_repository.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/modules/setContactToUser/set_contact_to_user_store.dart';

part 'set_contact_to_user_controller.g.dart';

class SetContactToUserController = _SetContactToUserControllerBase
    with _$SetContactToUserController;

abstract class _SetContactToUserControllerBase with Store {
  final SetContactsToUserStore store;
  final StoreRepository storeRepository;

  _SetContactToUserControllerBase(this.store, this.storeRepository) {
    listOfClients = store.repository
        .searchUsersByStoreAndYear(
            year: store.lastPurchaseYear,
            page: store.currentPage,
            store: store.clientStore)
        .asObservable();
  }

  @observable
  ObservableFuture<List<ClientModel>> listOfClients;
}
