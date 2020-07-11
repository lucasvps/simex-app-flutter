import 'package:simex_app/app/models/user_model.dart';

import '../custom_dio.dart';
import '../endpoints.dart';

class UserRepository {
  Future<List<UserModel>> getUsers() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.USER_URL;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<UserModel> users = [];

      for (var item in value.data) {
        UserModel userModel = UserModel.fromJson(item);
        users.add(userModel);
      }

      return users;
    }).catchError((err) {
      print('repo user error : ' + err.toString());
    });
  }

  Future getAnyUserInfo({String id}) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.USER_INFO + "/$id";

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      if (value.data['email'] != null) {
        return value.data;
      }
    }).catchError((err) {
      return err;
    });
  }
}
