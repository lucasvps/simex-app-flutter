import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/contacts_done_model.dart';
import 'package:simex_app/app/models/next_contacts_model.dart';

class ContactsRepository {
  Future contactsToDotoday(int id) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CONTACTS_TODO_TODAY;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<NextContactsModel> contactsToday = [];

      for (var item in value.data) {
        NextContactsModel contactsModel = NextContactsModel.fromJson(item);
        contactsToday.add(contactsModel);
      }

      return contactsToday;
    });
  }

  Future<List<ContactsDoneModel>> contactsDoneToday() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CONTACTS_DONE_TODAY;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ContactsDoneModel> contactsDoneToday = [];

      for (var item in value.data) {
        ContactsDoneModel contactsModel = ContactsDoneModel.fromJson(item);
        contactsDoneToday.add(contactsModel);
      }

      return contactsDoneToday;
    }).catchError((err) {
      print('repo erro ' + err.toString());
      return err;
    });
  }
}
