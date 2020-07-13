import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/newUser/new_user_store.dart';

part 'new_user_controller.g.dart';

class NewUserController = _NewUserControllerBase with _$NewUserController;

abstract class _NewUserControllerBase with Store {
  final NewUserStore store;

  _NewUserControllerBase(this.store);
}
