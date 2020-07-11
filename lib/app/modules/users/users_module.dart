import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/modules/users/users_store.dart';

import 'users_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'users_page.dart';

class UsersModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UsersController(i.get())),
        Bind((i) => UserStore(i.get())),
        Bind((i) => UserRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UsersPage()),
      ];

  static Inject get to => Inject<UsersModule>.of();
}
