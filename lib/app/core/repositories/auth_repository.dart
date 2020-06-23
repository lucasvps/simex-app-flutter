import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/core/interfaces/auth_repository_interface.dart';
import 'package:simex_app/app/core/interfaces/shared_local_storage_interface.dart';
import 'package:simex_app/app/models/user_model.dart';

class AuthRepository implements IAuthRepository {

  final ISharedLocalStorage iSharedLocalStorage;

  AuthRepository(this.iSharedLocalStorage);


  @override
  Future login(UserModel userModel) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.LOGIN_URL;

    var dio = CustomDio().instance;

    return await dio
        .post(url, data: userModel.toJsonLogin())
        .then((value) async {
          iSharedLocalStorage.put('token', value.data['token']);
          print(iSharedLocalStorage.get('token'));
      // var preferences = await SharedPreferences.getInstance();
      // preferences.setString('token', value.data['token']);
      print(value.data);
    }).catchError((err) {
      return err;
    });
  }

  @override
  Future logout() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.LOGOUT_URL;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      //prefs.commit();
      Modular.to.pushNamedAndRemoveUntil('/login', ModalRoute.withName(Modular.initialRoute));
    }).catchError((err){
      print(err.toString() + 'ERRO AQUI UHUUU');
    });
  }

  @override
  Future getCurrentUser() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CURRENT_USER_INFO;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){
      if (value.data['email'] != null){
         return value.data;
      }
      Modular.to.pushReplacementNamed('/login');
    }).catchError((err) {
      return err;
    });
  }

  @override
  Future refreshToken() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.REFRESH_TOKEN;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      //prefs.commit();
      iSharedLocalStorage.put('token', value.data['token']);

    });
  }

  
}
