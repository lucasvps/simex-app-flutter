import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/reportsRepositories/clients_report_repository.dart';
import 'package:simex_app/app/core/repositories/reportsRepositories/enterprise_report_repository.dart';
import 'package:simex_app/app/core/repositories/reportsRepositories/products_report_repository.dart';
import 'package:simex_app/app/models/reports/clients/clients_spent_more_model.dart';
import 'package:simex_app/app/models/reports/clients/clients_without_contact_model.dart';
import 'package:simex_app/app/models/reports/clients/clients_without_purchase.dart';
import 'package:simex_app/app/models/reports/enterprise/enterprise_report_model.dart';
import 'package:simex_app/app/models/reports/enterprise/user_report_model.dart';
import 'package:simex_app/app/models/reports/products/product_efective_eficiency_model.dart';
import 'package:simex_app/app/models/reports/products/product_lost_eficiency_model.dart';
import 'package:simex_app/app/models/reports/products/product_pending_eficiency_model.dart';
import 'package:simex_app/app/modules/pdf/pdf_store.dart';

part 'pdf_controller.g.dart';

class PdfController = _PdfControllerBase with _$PdfController;

abstract class _PdfControllerBase with Store {
  final ClientsReportRepository reportRepository;
  final ProductReportRepository productReportRepository;
  final EnterpriseReportRepository enterpriseReportRepository;
  final PDFStore store;

  _PdfControllerBase(this.reportRepository, this.store,
      this.productReportRepository, this.enterpriseReportRepository) {
    (store.daysContactsURL != null &&
            store.daysContactsURL != '0' &&
            store.daysContactsURL != '')
        ? clientsWithoutContact = reportRepository
            .clientsWithoutcontact(days: store.daysContactsURL)
            .asObservable()
        : null;

    (store.daysPurchaseURL != null &&
            store.daysPurchaseURL != '0' &&
            store.daysPurchaseURL != '')
        ? clientsWithoutPurchase = reportRepository
            .clientsWithoutPurchase(days: store.daysPurchaseURL)
            .asObservable()
        : null;

    clientsSpentMore = reportRepository.clientsSpentMore().asObservable();

    store.initialDateProduct != null
        ? productsEfectiveEficiency = productReportRepository
            .productsEficiency(
                initialDate: store.initialDateProduct,
                finalDate: store.finalDateProduct)
            .asObservable()
        : null;

    store.initialDateProduct != null
        ? productsPendingEficiency = productReportRepository
            .productsPendingEficiency(
                initialDate: store.initialDateProduct,
                finalDate: store.finalDateProduct)
            .asObservable()
        : null;

    store.initialDateProduct != null
        ? productsLostEficiency = productReportRepository
            .productsLostEficiency(
                initialDate: store.initialDateProduct,
                finalDate: store.finalDateProduct)
            .asObservable()
        : null;

    store.initialDateEnterprise != null
        ? enterpriseReportModel = enterpriseReportRepository
            .getEnterpriseReport(
                initialDate: store.initialDateEnterprise,
                finalDate: store.finalDateEnterprise)
            .asObservable()
        : null;

    store.initialDateUser != null
        ? userReportModel = enterpriseReportRepository.getUserReport(
          initialDate: store.initialDateUser,
          finalDate: store.finalDateUser,
          id: store.idUser
        ).asObservable()
        : null;
  }

  @observable
  ObservableFuture<List<ClientsWithoutContact>> clientsWithoutContact;

  @observable
  ObservableFuture<List<ClientsWithoutPurchase>> clientsWithoutPurchase;

  @observable
  ObservableFuture<List<ClientsSpentMore>> clientsSpentMore;

  @observable
  ObservableFuture<List<ProductsEfectiveEfficiencyModel>>
      productsEfectiveEficiency;

  @observable
  ObservableFuture<List<ProductsePendingEfficiencyModel>>
      productsPendingEficiency;

  @observable
  ObservableFuture<List<ProductsLostEfficiencyModel>> productsLostEficiency;

  @observable
  ObservableFuture<EnterpriseReportModel> enterpriseReportModel;

  @observable
  ObservableFuture<UserReportModel> userReportModel;
}
