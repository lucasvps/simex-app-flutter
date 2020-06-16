import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/next_contacts_model.dart';

class ContactsRepository {



  Future contactsToDotoday(int id) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CONTACTS_TODO_TODAY;

    print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){
      List<NextContactsModel> contactsToday = [];

      for (var item in value.data){
        NextContactsModel contactsModel = NextContactsModel.fromJson(item);
        contactsToday.add(contactsModel);
      }

      return contactsToday;
    });
  }




}