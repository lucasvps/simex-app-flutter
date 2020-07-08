import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/modules/pdf/pdf_store.dart';
import 'package:simex_app/app/modules/reports/reports_store.dart';

import 'reports_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reports_page.dart';

class ReportsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReportsController(i.get(), i.get(), i.get())),
        Bind((i) => ReportsStore()),
        Bind((i) => UserRepository()),
        Bind((i) => PDFStore()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ReportsPage()),
      ];

  static Inject get to => Inject<ReportsModule>.of();
}
