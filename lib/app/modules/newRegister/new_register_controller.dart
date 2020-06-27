import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/newRegister/new_register_store.dart';

part 'new_register_controller.g.dart';

class NewRegisterController = _NewRegisterControllerBase
    with _$NewRegisterController;

abstract class _NewRegisterControllerBase with Store {
  final NewRegisterStore store;

  _NewRegisterControllerBase(this.store);
}
