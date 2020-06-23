import 'package:mobx/mobx.dart';
import 'package:simex_app/app/models/register_model.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_store.dart';

part 'updateRegister_controller.g.dart';

class UpdateRegisterController = _UpdateRegisterControllerBase
    with _$UpdateRegisterController;

abstract class _UpdateRegisterControllerBase with Store {
  final UpdateRegisterStore store;

  _UpdateRegisterControllerBase(this.store);



  Future updateRegister(RegisterModel model, int id) async {
    return await store.repository.updateRegister(model, id);
  }

}
