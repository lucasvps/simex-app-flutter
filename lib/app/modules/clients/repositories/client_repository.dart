import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/client_model.dart';

class ClientRepository {


  Future searchedUserByDoc(String doc) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.SEARCHED_CLIENT_INFO + "?conditions=cpf:=:" + doc;
    
    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){
      List<ClientModel> client = [];
      
      for (var item in value.data){
        ClientModel clientModel = ClientModel.fromJson(item);
        client.add(clientModel);
      }
      return client;
      // var client = ClientModel.fromJson(value.data[0]);
      // return client;
    }).catchError((err){
      return null;
    });
  }


  Future updateClient(int id, ClientModel clientModel) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CLIENTS_URL + "/$id";

    var dio = CustomDio.withAuthentication().instance;

    return await dio.put(url, data: clientModel.toJson()).then((value){
      Modular.to.pushReplacementNamed('/home');
    }).catchError((err){
      return err;
    });


  }




}