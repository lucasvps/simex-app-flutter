import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/newClient/new_client_store.dart';

part 'new_client_controller.g.dart';

class NewClientController = _NewClientControllerBase with _$NewClientController;

abstract class _NewClientControllerBase with Store {
  final NewClientStore store;

  _NewClientControllerBase(this.store);
}
