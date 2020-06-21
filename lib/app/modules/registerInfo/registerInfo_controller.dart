import 'package:mobx/mobx.dart';

part 'registerInfo_controller.g.dart';

class RegisterInfoController = _RegisterInfoControllerBase
    with _$RegisterInfoController;

abstract class _RegisterInfoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
