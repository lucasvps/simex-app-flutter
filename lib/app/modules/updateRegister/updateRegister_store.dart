import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';

part 'updateRegister_store.g.dart';

class UpdateRegisterStore = _UpdateRegisterStoreBase with _$UpdateRegisterStore;

abstract class _UpdateRegisterStoreBase with Store {
  final RegisterRepository repository;
  _UpdateRegisterStoreBase(this.repository);


  @observable
  int currentStep = 0;

  @action
  setCurrentStep(int value) => currentStep = value;

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
    setStatus(null);
    setValueSold(null);
    setReason(null);
    setObservation(null);
    setContactFrom(null);
    setNextContactBr(null);
    setNextContact(null);
    setAmountSold(null);
  }
}
