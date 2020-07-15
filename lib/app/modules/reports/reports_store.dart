import 'package:mobx/mobx.dart';

part 'reports_store.g.dart';

class ReportsStore = _ReportsStoreBase with _$ReportsStore;

abstract class _ReportsStoreBase with Store {

  @observable
  String choice;

  @action
  setChoice(String value) => choice = value;

  @observable
  bool clientsWithoutContact = false;

  @action
  setClientsWithoutContact() => clientsWithoutContact = !clientsWithoutContact;

  //!-----------------!//

  @observable
  bool clientsWithoutPurchase = false;

  @action
  setClientsWithoutPurchase() => clientsWithoutPurchase = !clientsWithoutPurchase;

  //!-----------------!//

  @observable
  bool clientsThatSpentMore = false;

  @action
  setClientsThatSpentMore() => clientsThatSpentMore = !clientsThatSpentMore;

  //!-----------------!//

  @observable
  bool productEficiency = false;

  @action
  setProductEficiency() => productEficiency = !productEficiency;

  //!-----------------!//
  
  @observable
  bool enterpriseReport = false;

  @action
  setEnterpriseReport() => enterpriseReport = !enterpriseReport;


  //!-----------------!//

  @observable
  bool userReport = false;

  @action
  setUserReport() => userReport = !userReport;



  //! ---------------!//

  @observable
  bool fullUserReport = false;

  @action
  setFullUserReport() => fullUserReport = !fullUserReport;


}
