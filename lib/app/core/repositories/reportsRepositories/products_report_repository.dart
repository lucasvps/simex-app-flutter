import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/reports/products/product_efective_eficiency_model.dart';
import 'package:simex_app/app/models/reports/products/product_lost_eficiency_model.dart';
import 'package:simex_app/app/models/reports/products/product_pending_eficiency_model.dart';

class ProductReportRepository {
  Future<List<ProductsEfectiveEfficiencyModel>> productsEficiency(
      {String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.PRODUCT_EFICIENCY +
        "/$initialDate" +
        "/$finalDate";

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ProductsEfectiveEfficiencyModel> products = [];

      for (var item in value.data) {
        ProductsEfectiveEfficiencyModel product =
            ProductsEfectiveEfficiencyModel.fromJson(item);

        products.add(product);
      }

      return products;
    }).catchError((err) {
      print('repo error PRODUCT :' + err.toString());
    });
  }

  Future<List<ProductsePendingEfficiencyModel>> productsPendingEficiency(
      {String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.PRODUCT_PENDING_EFICIENCY +
        "/$initialDate" +
        "/$finalDate";

    print(url);
    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ProductsePendingEfficiencyModel> products = [];

      for (var item in value.data) {
        ProductsePendingEfficiencyModel product =
            ProductsePendingEfficiencyModel.fromJson(item);

        products.add(product);
      }

      return products;
    }).catchError((err) {
      print('repo error PRODUCT :' + err.toString());
    });
  }

  Future<List<ProductsLostEfficiencyModel>> productsLostEficiency(
      {String initialDate, String finalDate}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.PRODUCT_LOST_EFICIENCY +
        "/$initialDate" +
        "/$finalDate";

    print(url);
    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      print(value.data);
      List<ProductsLostEfficiencyModel> products = [];

      for (var item in value.data) {
        ProductsLostEfficiencyModel product =
            ProductsLostEfficiencyModel.fromJson(item);
        print(product);
        products.add(product);
      }

      return products;
    }).catchError((err) {
      print('repo error PRODUCT :' + err.toString());
    });
  }
}
