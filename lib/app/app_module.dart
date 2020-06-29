import 'package:simex_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:simex_app/app/app_widget.dart';
import 'package:simex_app/app/core/interfaces/auth_repository_interface.dart';
import 'package:simex_app/app/core/interfaces/shared_local_storage_interface.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/core/services/shared_local_storage_service.dart';
import 'package:simex_app/app/core/stores/auth_store.dart';
import 'package:simex_app/app/modules/clients/clients_module.dart';
import 'package:simex_app/app/modules/contatos/contatos_module.dart';
import 'package:simex_app/app/modules/home/home_module.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_module.dart';
import 'package:simex_app/app/modules/login/login_module.dart';
import 'package:simex_app/app/modules/newClient/new_client_module.dart';
import 'package:simex_app/app/modules/newProduct/new_product_module.dart';
import 'package:simex_app/app/modules/newRegister/new_register_module.dart';
import 'package:simex_app/app/modules/splash/splash_module.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_controller.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_store.dart';

import 'core/repositories/auth_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController(i.get())),
        Bind<IAuthRepository>((i) => AuthRepository(i.get())),
        Bind<ISharedLocalStorage>((i) => SharedLocalStorageService()),
        Bind((i) => AuthStore(i.get())),
        Bind((i) => UpdateRegisterController(i.get())),
        Bind((i) => UpdateRegisterStore(i.get())),
        Bind((i) => RegisterRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: SplashModule()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/clients', module: ClientsModule()),
        Router('/contacts', module: ContatosModule()),
        Router('/info', module: InfoClientModule()),
        Router('/newClient', module: NewClientModule()),
        Router('/newRegister', module: NewRegisterModule()),
        Router('/newProduct', module: NewProductModule()),
        //Router('/updateRegister', module: UpdateRegisterModule()),
        
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
