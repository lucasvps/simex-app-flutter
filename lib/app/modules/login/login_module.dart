import 'package:simex_app/app/core/interfaces/auth_repository_interface.dart';
import 'package:simex_app/app/core/interfaces/shared_local_storage_interface.dart';
import 'package:simex_app/app/core/repositories/auth_repository.dart';
import 'package:simex_app/app/core/services/shared_local_storage_service.dart';
import 'package:simex_app/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/modules/login/login_page.dart';
import 'package:simex_app/app/modules/login/login_store.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get())),
        Bind((i) => LoginStore(i.get())),
        Bind<IAuthRepository>((i) => AuthRepository(i.get())),
        Bind<ISharedLocalStorage>((i) => SharedLocalStorageService())
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
