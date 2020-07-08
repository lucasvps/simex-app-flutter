import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/reports/enterprise/enterprise_report_model.dart';

class EnterpriseReportRepository{


  Future<EnterpriseReportModel> getEnterpriseReport({String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.ENTERPRISE_REPORT + "/$initialDate" + "/$finalDate";

    var dio = CustomDio.withAuthentication().instance;

    print(url);

    return await dio.get(url).then((value){
      print(value.data);
      EnterpriseReportModel reportModel = EnterpriseReportModel.fromJson(value.data);
      return reportModel;
    });
  }

}