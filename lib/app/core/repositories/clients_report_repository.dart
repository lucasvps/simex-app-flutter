import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/reports/clients/clients_spent_more_model.dart';
import 'package:simex_app/app/models/reports/clients/clients_without_contact_model.dart';
import 'package:simex_app/app/models/reports/clients/clients_without_purchase.dart';

class ClientsReportRepository {

  Future<List<ClientsWithoutContact>> clientsWithoutcontact({String days}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.CLIENTS_WITHOUT_CONTACTS + "/$days";

    print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ClientsWithoutContact> clients = [];

      for (var item in value.data) {
        ClientsWithoutContact client = ClientsWithoutContact.fromJson(item);

        clients.add(client);
      }
      
      return clients;
    }).catchError((err) {
      print('repo error :' + err.toString());
    });
  }

  Future<List<ClientsWithoutPurchase>> clientsWithoutPurchase({String days}) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.CLIENTS_WITHOUT_PURCHASE + "/$days";

    

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ClientsWithoutPurchase> clients = [];

      for (var item in value.data) {
        ClientsWithoutPurchase client = ClientsWithoutPurchase.fromJson(item);

        clients.add(client);
      }
      
      return clients;
    }).catchError((err) {
      print('repo error :' + err.toString());
    });
  }

  Future<List<ClientsSpentMore>> clientsSpentMore() async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.CLIENTS_SPENT_MORE;

    
    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      
      List<ClientsSpentMore> clients = [];

      for (var item in value.data) {
        ClientsSpentMore client = ClientsSpentMore.fromJson(item);
        
        clients.add(client);
      }
      
      return clients;
    }).catchError((err) {
      print('repo error :' + err.toString());
    });
  }
}
