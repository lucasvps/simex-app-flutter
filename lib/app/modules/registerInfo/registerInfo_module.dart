import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/core/repositories/client_repository.dart';
import 'package:simex_app/app/modules/registerInfo/registerInfo_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/registerInfo/registerInfo_page.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_page.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_store.dart';

class RegisterInfoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterInfoController(i.get())),
        Bind((i) => UpdateRegisterStore(i.get(), i.get())),
        Bind((i) => RegisterRepository()),
        Bind((i) => ProductRepository()),
         Bind((i) => ClientRepository()),
       
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterInfoPage()),
        Router('/update', child: (_, args) => UpdateRegisterPage()),
      ];

  static Inject get to => Inject<RegisterInfoModule>.of();
}
