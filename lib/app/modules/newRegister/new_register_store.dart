import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';

part 'new_register_store.g.dart';

class NewRegisterStore = _NewRegisterStoreBase with _$NewRegisterStore;

abstract class _NewRegisterStoreBase with Store {
  final RegisterRepository repository;
  final ProductRepository productRepository;

  _NewRegisterStoreBase(this.repository, this.productRepository);

  @observable
  int currentStep = 0;

  @action
  setCurrentStep(int value) => currentStep = value;

  @observable
  int currentUserID;

  @action
  setCurrentUserID(int value) => currentUserID = value;

  @observable
  bool efectiveSell = false;

  @observable
  bool pendingSell = false;

  @observable
  String status;

  @action
  setStatus(String value) => status = value;

  @observable
  String valueSold;

  @action
  setValueSold(String value) => valueSold = value;


  @observable
  int productAmount;

  @action
  setProductAmount(int value) => productAmount = value;

  @observable
  String productName;

  @action
  setProductName(String value) => productName = value;

  @observable
  String observation;

  @action
  setObservation(String value) => observation = value;


  @observable
  String nextContact;

  @action
  setNextContact(String value) => nextContact = value;

  @observable
  String nextContactBR;

  @action
  setNextContactBr(String value) => nextContactBR = value;

  @observable
  String contactFrom;

  @action
  setContactFrom(String value) => contactFrom = value;

  @observable
  int amountSold;

  @action
  setAmountSold(int value) {
    amountSold = value;
  }

  @observable
  String productPrice = "";

  @action
  setProductPrice(String value) => productPrice = value;

  @observable
  String prodID;

  @action
  setProdId(String value) => prodID = value;
}