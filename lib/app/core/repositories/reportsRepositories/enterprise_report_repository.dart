import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/reports/enterprise/enterprise_report_model.dart';
import 'package:simex_app/app/models/reports/enterprise/full_report_model.dart';
import 'package:simex_app/app/models/reports/enterprise/user_report_model.dart';

class EnterpriseReportRepository {
  Future<EnterpriseReportModel> getEnterpriseReport(
      {String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.ENTERPRISE_REPORT +
        "/$initialDate" +
        "/$finalDate";

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      EnterpriseReportModel reportModel =
          EnterpriseReportModel.fromJson(value.data);

      return reportModel;
    }).catchError((err) {
      return err;
    });
  }

  Future<List<ActivePhoneModel>> getFullUsersReportActivePhone(
      {String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.FULL_REPORT_ACTIVE +
        "/$initialDate" +
        "/$finalDate";

        print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {

      print(value.data);
      List<ActivePhoneModel> list = [];

      for (var item in value.data) {
        ActivePhoneModel reportModel = ActivePhoneModel.fromJson(item);
        list.add(reportModel);
      }

      return list;
    }).catchError((err) {
      return err;
    });
  }


  Future<List<ReceivedCallModel>> getFullUsersReportReceivedCall(
      {String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.FULL_REPORT_RECEIVED +
        "/$initialDate" +
        "/$finalDate";

        print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {

      print(value.data);
      List<ReceivedCallModel> list = [];

      for (var item in value.data) {
        ReceivedCallModel reportModel = ReceivedCallModel.fromJson(item);
        list.add(reportModel);
      }

      return list;
    }).catchError((err) {
      return err;
    });
  }

  Future<List<ExternalVisitModel>> getFullUsersReportExternalVisit(
      {String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.FULL_REPORT_EXTERNAL +
        "/$initialDate" +
        "/$finalDate";

        print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {

      print(value.data);
      List<ExternalVisitModel> list = [];

      for (var item in value.data) {
        ExternalVisitModel reportModel = ExternalVisitModel.fromJson(item);
        list.add(reportModel);
      }

      return list;
    }).catchError((err) {
      return err;
    });
  }

  Future<List<BalconyContactModel>> getFullUsersReportBalcony(
      {String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.FULL_REPORT_balcony +
        "/$initialDate" +
        "/$finalDate";

        print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {

      print(value.data);
      List<BalconyContactModel> list = [];

      for (var item in value.data) {
        BalconyContactModel reportModel = BalconyContactModel.fromJson(item);
        list.add(reportModel);
      }

      return list;
    }).catchError((err) {
      return err;
    });
  }












  Future<UserReportModel> getUserReport(
      {String initialDate, String finalDate, String id}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.USER_REPORT +
        "/$initialDate" +
        "/$finalDate" +
        "/$id";

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      UserReportModel reportModel = UserReportModel.fromJson(value.data);
      return reportModel;
    });
  }
}
