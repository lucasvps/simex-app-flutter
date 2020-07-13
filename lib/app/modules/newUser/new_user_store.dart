import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/models/user_model.dart';

part 'new_user_store.g.dart';

class NewUserStore = _NewUserStoreBase with _$NewUserStore;

abstract class _NewUserStoreBase with Store {
  final UserRepository repository;

  _NewUserStoreBase(this.repository);

  @observable
  String name;

  @action
  setUserName(String value) => name = value;

  @observable
  String email;

  @action
  setUserEmail(String value) => email = value;

  @observable
  String password;

  @action
  setUserPassword(String value) => password = value;

  @observable
  bool isAdmin = false;

  @action
  setIsAdmin() => isAdmin = !isAdmin;

  registerUser() {
    UserModel userModel = UserModel(
        name: name,
        email: email,
        password: password,
        isAdmin: isAdmin == true ? 1 : 0);

    repository.registerUser(userModel);
  }

  @computed
  bool get isButtonValid {
    return validateEmail() == null &&
        validateName() == null &&
        validatePassword() == null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  String validateEmail() {
    if (email == null || email.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  String validatePassword() {
    if (password == null || password.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }
    if (password.length <= 6) {
      return 'A senha precisa ter mais de 6 caracteres!';
    }

    return null;
  }

  String validateAdmin() {
    if (isAdmin == null) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  @observable
  bool isPasswordVisible = false;

  @action
  changeVisibility() => isPasswordVisible = !isPasswordVisible;

}
