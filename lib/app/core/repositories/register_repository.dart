import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/register_model.dart';
import 'package:simex_app/app/models/registers_done_model.dart';
import 'package:simex_app/app/modules/registersDone/registers_done_store.dart';

class RegisterRepository {
  Future updateRegister(RegisterModel model, int id) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.REGISTERS_URL + '/$id';
    print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.put(url, data: model.toJson()).then((value) {
      Modular.to.pushReplacementNamed('/contacts');
    }).catchError((err) {
      return err;
    });
  }

  Future createRegister(RegisterModel model) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.REGISTERS_URL;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.post(url, data: model).then((value) {
      Modular.to.pushReplacementNamed('/contacts');
    }).catchError((err) {
      return err;
    });
  }

  Future registersDoneByUser([String page]) async {
    String url =
        ApiEndpoints.MAIN_URL + ApiEndpoints.REGISTERS_DONE + "?page=$page";

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<RegistersDone> registers = [];

      Modular.get<RegistersDoneStore>()
          .setLastPage(value.data['last_page'].toString());

      for (var item in value.data['data']) {
        RegistersDone done = RegistersDone.fromJson(item);

        registers.add(done);
      }

      return registers;
    });
  }
}
