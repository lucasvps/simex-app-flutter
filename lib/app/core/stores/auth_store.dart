import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/interfaces/auth_repository_interface.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthRepository authRepository;

  _AuthStoreBase(this.authRepository);

  Future getCurrentUser() async {
    return await authRepository.getCurrentUser();
  }

  Future logout() async {
    return await authRepository.logout();
  }

  Future refresh() async {
    return await authRepository.refreshToken();
  }
 }
