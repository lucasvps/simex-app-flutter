import 'package:mobx/mobx.dart';
import 'package:simex_app/app/models/register_model.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_store.dart';

part 'registerInfo_controller.g.dart';

class RegisterInfoController = _RegisterInfoControllerBase
    with _$RegisterInfoController;

abstract class _RegisterInfoControllerBase with Store {
  final UpdateRegisterStore store;

  _RegisterInfoControllerBase(this.store);

  Future updateRegister(RegisterModel model, int id) async {
    return await store.repository.updateRegister(model, id);
  }
}
