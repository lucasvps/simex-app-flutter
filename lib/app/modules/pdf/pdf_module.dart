import 'package:simex_app/app/core/repositories/clients_report_repository.dart';
import 'package:simex_app/app/modules/pdf/pdf_viewer_page.dart';

import 'pdf_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pdf_page.dart';

class PdfModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PdfController(i.get())),
        Bind((i) => ClientsReportRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => PdfPage()),
        Router('/view', child: (_, args) => PDFViewerPage()),
      ];

  static Inject get to => Inject<PdfModule>.of();
}
