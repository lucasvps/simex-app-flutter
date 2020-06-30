import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/registersDone/registers_done_store.dart';

part 'registers_done_controller.g.dart';

class RegistersDoneController = _RegistersDoneControllerBase
    with _$RegistersDoneController;

abstract class _RegistersDoneControllerBase with Store {
  final RegistersDoneStore store;

  _RegistersDoneControllerBase(this.store);
}
