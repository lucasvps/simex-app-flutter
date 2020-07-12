import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/modules/clients/clients_store.dart';

class ClientRepository {
  Future searchedUserByDoc(String doc) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.SEARCHED_CLIENT_INFO +
        "?conditions=cpf:=:" +
        doc;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ClientModel> client = [];

      for (var item in value.data) {
        ClientModel clientModel = ClientModel.fromJson(item);
        client.add(clientModel);
      }
      return client;
      // var client = ClientModel.fromJson(value.data[0]);
      // return client;
    }).catchError((err) {
      return null;
    });
  }

  Future searchedUserByName({String name, String page}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.SEARCH_CLIENT_NAME +
        "/$name" +
        "?page=$page";

    print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ClientModel> client = [];

      for (var item in value.data['data']) {
        ClientModel clientModel = ClientModel.fromJson(item);
        client.add(clientModel);
      }

      return client;
    }).catchError((err) {
      return null;
    });
  }

  Future lastPageClientsByName(String name) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.SEARCH_CLIENT_NAME + "/$name?page=1" ;


    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      Modular.get<ClientStore>().setLastPage(value.data['last_page'].toString());
      return value.data['last_page'];
    });
  }

  Future<ClientModel> clientById(int id) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CLIENTS_URL + "/$id";

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      ClientModel model = ClientModel.fromJson(value.data);
      return value.data;
    });
  }

  Future updateClient(int id, ClientModel clientModel) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CLIENTS_URL + "/$id";

    var dio = CustomDio.withAuthentication().instance;

    return await dio.put(url, data: clientModel.toJson()).then((value) {
      Modular.to.pushReplacementNamed('/contacts');
    }).catchError((err) {
      print('erro reposit' + err.toString());
      return err;
    });
  }

  Future createClient(ClientModel clientModel) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CLIENTS_URL;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.post(url, data: clientModel.toJson()).then((value) {
      //Modular.to.pushReplacementNamed('/contacts');
    }).catchError((err) {
      return err;
    });
  }
}
