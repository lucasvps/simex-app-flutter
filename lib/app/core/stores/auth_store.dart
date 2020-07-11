import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/interfaces/auth_repository_interface.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthRepository authRepository;

  _AuthStoreBase(this.authRepository);

  @observable
  bool isLoading = false;

  @action
  changeIsLoading() => isLoading = !isLoading;

  Future getCurrentUser() async {
    return await authRepository.getCurrentUser();
  }

  Future logout() async {
    return await authRepository.logout();
  }

  Future refresh() async {
    return await authRepository.refreshToken();
  }

  @observable
  String userName;

  @action
  setUserName(String value) => userName = value;

  @observable
  String userEmail;

  @action
  setUserEmail(String value) => userEmail = value;

  @observable
  int isAdmin;

  @action
  setIsAdmin(int value) => isAdmin = value;

 }
