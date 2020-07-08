import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/modules/pdf/pdf_store.dart';
import 'package:simex_app/app/modules/reports/reports_store.dart';

part 'reports_controller.g.dart';

class ReportsController = _ReportsControllerBase with _$ReportsController;

abstract class _ReportsControllerBase with Store {
  final ReportsStore store;
  final PDFStore pdfStore;
  final UserRepository userRepository;

  _ReportsControllerBase(this.store, this.pdfStore, this.userRepository);
}
