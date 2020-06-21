import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';

part 'updateRegister_store.g.dart';

class UpdateRegisterStore = _UpdateRegisterStoreBase with _$UpdateRegisterStore;

abstract class _UpdateRegisterStoreBase with Store {
  final RegisterRepository repository;
  _UpdateRegisterStoreBase(this.repository);

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
  int valueSold;

  @action
  setValueSold(int value) => valueSold = value;

  @observable
  String observation;

  @action
  setObservation(String value) => observation = value;

  @observable
  String reason;

  @action
  setReason(String value) => reason = value;

  @observable
  String contactFrom;

  @action
  setContactFrom(String value) => contactFrom = value;


}