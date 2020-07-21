import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/models/store_model.dart';

import '../endpoints.dart';

class StoreRepository {

  Future<List<StoreModel>> getAllStore() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.STORE_URL;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){
      List<StoreModel> stores = [];

      for (var item in value.data){
        StoreModel store = StoreModel.fromJson(item);
        stores.add(store);
      }

      return stores;
    });
  }



}