import 'package:simex_app/app/core/repositories/reportsRepositories/clients_report_repository.dart';
import 'package:simex_app/app/core/repositories/reportsRepositories/enterprise_report_repository.dart';
import 'package:simex_app/app/core/repositories/reportsRepositories/products_report_repository.dart';
import 'package:simex_app/app/modules/pdf/pdf_store.dart';
import 'package:simex_app/app/modules/pdf/pdf_viewer_page.dart';

import 'pdf_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pdf_page.dart';

class PdfModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PdfController(i.get(), i.get(), i.get(), i.get())),
        Bind((i) => ClientsReportRepository()),
        Bind((i) => ProductReportRepository()),
        Bind((i) => EnterpriseReportRepository()),
        Bind((i) => PDFStore()),
      ];

  @override
  List<Router> get routers => [
        Router('/:choice', child: (_, args) => PdfPage(choice: args.params['choice'],)),
        Router('/view', child: (_, args) => PDFViewerPage()),
      ];

  static Inject get to => Inject<PdfModule>.of();
}
