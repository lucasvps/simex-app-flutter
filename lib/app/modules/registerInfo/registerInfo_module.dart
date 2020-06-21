import 'package:simex_app/app/modules/registerInfo/registerInfo_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/registerInfo/registerInfo_page.dart';

class RegisterInfoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterInfoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterInfoPage()),
      ];

  static Inject get to => Inject<RegisterInfoModule>.of();
}
