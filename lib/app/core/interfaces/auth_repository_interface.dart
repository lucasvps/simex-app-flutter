import 'package:simex_app/app/models/user_model.dart';

abstract class IAuthRepository {
  Future login(UserModel userModel);
  Future logout();
  Future getCurrentUser();
  Future refreshToken()
;}
