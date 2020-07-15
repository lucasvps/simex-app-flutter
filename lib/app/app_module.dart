import 'package:simex_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:simex_app/app/app_widget.dart';
import 'package:simex_app/app/core/interfaces/auth_repository_interface.dart';
import 'package:simex_app/app/core/interfaces/shared_local_storage_interface.dart';
import 'package:simex_app/app/core/repositories/product_repository.dart';
import 'package:simex_app/app/core/repositories/reportsRepositories/enterprise_report_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/core/services/shared_local_storage_service.dart';
import 'package:simex_app/app/core/stores/auth_store.dart';
import 'package:simex_app/app/modules/activesProducts/actives_products_module.dart';
import 'package:simex_app/app/modules/clients/clients_module.dart';
import 'package:simex_app/app/modules/clients/repositories/client_repository.dart';
import 'package:simex_app/app/modules/contactsByUser/contacts_by_user_module.dart';
import 'package:simex_app/app/modules/contatos/contatos_module.dart';
import 'package:simex_app/app/modules/home/home_module.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_module.dart';
import 'package:simex_app/app/modules/login/login_module.dart';
import 'package:simex_app/app/modules/newClient/new_client_module.dart';
import 'package:simex_app/app/modules/newProduct/new_product_module.dart';
import 'package:simex_app/app/modules/newRegister/new_register_module.dart';
import 'package:simex_app/app/modules/newUser/new_user_module.dart';
import 'package:simex_app/app/modules/pdf/pdf_module.dart';
import 'package:simex_app/app/modules/registersDone/registers_done_module.dart';
import 'package:simex_app/app/modules/reports/reports_module.dart';
import 'package:simex_app/app/modules/splash/splash_module.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_controller.dart';
import 'package:simex_app/app/modules/updateRegister/updateRegister_store.dart';
import 'package:simex_app/app/modules/users/users_module.dart';

import 'core/repositories/auth_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController(i.get(), i.get())),
        Bind<IAuthRepository>((i) => AuthRepository(i.get())),
        Bind<ISharedLocalStorage>((i) => SharedLocalStorageService()),
        Bind((i) => AuthStore(i.get())),
        Bind((i) => UpdateRegisterController(i.get())),
        Bind((i) => UpdateRegisterStore(i.get(), i.get())),
        Bind((i) => RegisterRepository()),
        Bind((i) => EnterpriseReportRepository()),
        Bind((i) => ProductRepository()),
        Bind((i) => ClientRepository()),
        
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
        Router('/activesProduct', module: ActivesProductsModule()),
        Router('/registersDone', module: RegistersDoneModule()),
        Router('/pdfCreate', module: PdfModule()),
        Router('/reports', module: ReportsModule()),
        Router('/users', module: UsersModule()),
        Router('/contactsByUser', module: ContactsByUserModule()),
        Router('/newUser', module: NewUserModule()),
        //Router('/updateRegister', module: UpdateRegisterModule()),
        
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
