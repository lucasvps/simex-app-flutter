import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/clients_report_repository.dart';
import 'package:simex_app/app/models/reports/clients_without_contact_model.dart';

part 'pdf_controller.g.dart';

class PdfController = _PdfControllerBase with _$PdfController;

abstract class _PdfControllerBase with Store {
  final ClientsReportRepository reportRepository;

  _PdfControllerBase(this.reportRepository){
    clientsWithoutContact = reportRepository.clientsWithoutcontact(days: '30').asObservable();
  }

 
  @observable
  ObservableFuture<List<ClientsWithoutContact>> clientsWithoutContact;

}
