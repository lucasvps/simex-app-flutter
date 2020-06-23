import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/register_model.dart';

class RegisterRepository {
  Future updateRegister(RegisterModel model, int id) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.REGISTERS_URL + '/$id';
    print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio
        .put(url, data: model.toJson())
        .then((value) {
          Modular.to.pushReplacementNamed('/home');
        })
        .catchError((err) {
      return err;
    });
  }
}
