import 'package:mobx/mobx.dart';

part 'reports_store.g.dart';

class ReportsStore = _ReportsStoreBase with _$ReportsStore;

abstract class _ReportsStoreBase with Store {
  @observable
  bool clientsWithoutContact = false;

  @action
  setClientsWithoutContact() => clientsWithoutContact = !clientsWithoutContact;

  @observable
  bool clientsWithoutPurchase = false;

  @action
  setClientsWithoutPurchase() => clientsWithoutPurchase = !clientsWithoutPurchase;

}
