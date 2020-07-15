import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/modules/clients/repositories/client_repository.dart';

part 'updateRegister_store.g.dart';

class UpdateRegisterStore = _UpdateRegisterStoreBase with _$UpdateRegisterStore;

abstract class _UpdateRegisterStoreBase with Store {
  final RegisterRepository repository;
  final ClientRepository clientRepository;
  //final ProductRepository productRepository;
  _UpdateRegisterStoreBase(this.repository, this.clientRepository);

  @observable
  int currentStep = 0;

  @action
  setCurrentStep(int value) {
    currentStep = value;
    //print('NOVO STEP = ' + currentStep.toString());
  }

  @observable
  bool lostSell = false;

  @observable
  bool efectiveSell = false;

  @observable
  bool pendingSell = false;

  @observable
  String status;

  @action
  setStatus(String value) => status = value;

  @observable
  double valueSold;

  @action
  setValueSold(double value) => valueSold = value;

  @observable
  String observation;

  @action
  setObservation(String value) => observation = value;

  @observable
  String reason;

  @action
  setReason(String value) => reason = value;

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
  String productPrice = "0.0";

  @action
  setProductPrice(String value) {
    productPrice = value;
    print('producto price = ' + productPrice);
  }

  @observable
  String prodID;

  @action
  setProdId(String value) => prodID = value;

  // @observable
  // String productName;

  // @action
  // setProductName(String value) => productName = value;

  // @observable
  // bool noProduct = false;

  // @action
  // changeNoProduct() => noProduct = !noProduct;

  //! **************************** VALIDAÇOES ****************************************

  String validateContactFrom() {
    if (contactFrom == null || contactFrom.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String validateContactStatus() {
    if (status == null || status.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String validateReason() {
    if (reason == null || reason.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  @computed
  bool get notLostButtonValid {
    return validateContactFrom() == null && validateContactStatus() == null;
  }

  @computed
  bool get lostSellButtonValid {
    return validateContactFrom() == null &&
        validateContactStatus() == null &&
        validateReason() == null;
  }

  cleanFields() {
    print('ENTRO NO CLEAN FIELDS');
    setStatus(null);
    setValueSold(null);
    setReason(null);
    setObservation(null);
    setContactFrom(null);
    setNextContactBr(null);
    setNextContact(null);
    setAmountSold(null);
    setProdId(null);
    setProductPrice('0.0');
    //noProduct = false;
  }
}
