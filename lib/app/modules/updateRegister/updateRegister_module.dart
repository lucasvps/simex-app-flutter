import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/core/repositories/client_repository.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_page.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_store.dart';

class UpdateRegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UpdateRegisterController(i.get())),
        Bind((i) => UpdateRegisterStore(i.get(), i.get())),
        Bind((i) => RegisterRepository()),
        Bind((i) => ClientRepository()),
        
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UpdateRegisterPage()),
      ];

  static Inject get to => Inject<UpdateRegisterModule>.of();
}
