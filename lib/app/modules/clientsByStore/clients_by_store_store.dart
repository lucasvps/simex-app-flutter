import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/client_repository.dart';

part 'clients_by_store_store.g.dart';

class ClientsByStoreStore = _ClientsByStoreStoreBase with _$ClientsByStoreStore;

abstract class _ClientsByStoreStoreBase with Store {
  final ClientRepository repository;

  @observable
  String clientStore;

  _ClientsByStoreStoreBase(this.repository);

  @action
  setClientStore(String value) => clientStore = value;

  @observable
  String lastPurchaseYear;

  @action
  setLastPurchaseYear(String value) => lastPurchaseYear = value;

  @observable
  String currentPage = '1';

  @action
  setCurrentPage(String value) => currentPage = value;

  @observable
  String lastPage;

  @action
  setLastPage(String value) => lastPage = value;
}