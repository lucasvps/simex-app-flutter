import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/modules/newUser/new_user_store.dart';

import 'new_user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'new_user_page.dart';

class NewUserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewUserController(i.get())),
        Bind((i) => NewUserStore(i.get())),
        Bind((i) => UserRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => NewUserPage()),
      ];

  static Inject get to => Inject<NewUserModule>.of();
}
