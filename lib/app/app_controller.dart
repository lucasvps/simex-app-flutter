import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/reportsRepositories/enterprise_report_repository.dart';
import 'package:simex_app/app/core/stores/auth_store.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final AuthStore authStore;
  final EnterpriseReportRepository reportRepository;

  _AppControllerBase(this.authStore, this.reportRepository);

  Future currentUser() async {
    return await authStore.getCurrentUser();
  }
}
