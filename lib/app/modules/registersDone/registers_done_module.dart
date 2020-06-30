import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/modules/registersDone/registers_done_store.dart';

import 'registers_done_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'registers_done_page.dart';

class RegistersDoneModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegistersDoneController(i.get())),
        Bind((i) => RegistersDoneStore(i.get())),
        Bind((i) => RegisterRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => RegistersDonePage()),
      ];

  static Inject get to => Inject<RegistersDoneModule>.of();
}
