import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/client_model.dart';

class ClientRepository {


  Future<ClientModel> searchedUserByDoc(String doc) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.SEARCHED_CLIENT_INFO + "?conditions=cpf:=:" + doc;
    
    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){
      var client = ClientModel.fromJson(value.data[0]);
      print(client.name);
      return client;
    }).catchError((err){
      return null;
    });
  }




}