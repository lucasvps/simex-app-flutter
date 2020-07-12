import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/contactsByUser/contacts_by_user_store.dart';

part 'contacts_by_user_controller.g.dart';

class ContactsByUserController = _ContactsByUserControllerBase
    with _$ContactsByUserController;

abstract class _ContactsByUserControllerBase with Store {
  final ContactsByUserStore store;

  _ContactsByUserControllerBase(this.store);
}
