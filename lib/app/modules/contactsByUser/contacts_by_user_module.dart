import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/modules/contactsByUser/contacts_by_user_store.dart';

import 'contacts_by_user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'contacts_by_user_page.dart';

class ContactsByUserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ContactsByUserController(i.get())),
        Bind((i) => ContactsByUserStore(i.get())),
        Bind((i) => UserRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ContactsByUserPage()),
      ];

  static Inject get to => Inject<ContactsByUserModule>.of();
}
