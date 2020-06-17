import 'package:simex_app/app/modules/clients/repositories/client_repository.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_page.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_store.dart';

class InfoClientModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => InfoClientController(i.get())),
        Bind((i) => InfoClientStore(i.get())),
        Bind((i) => ClientRepository())
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => InfoClientPage()),
      ];

  static Inject get to => Inject<InfoClientModule>.of();
}
