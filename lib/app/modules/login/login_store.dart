import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/interfaces/auth_repository_interface.dart';
import 'package:simex_app/app/models/user_model.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final IAuthRepository authRepository;
  _LoginStoreBase(this.authRepository);


  @observable
  bool isObscure = true;

  @action
  void changeObscure() => isObscure = !isObscure; 

  @observable
  String email;

  @action
  setEmail(String value) => email = value;

  @observable
  String password;

  @action
  setPassword(String value) => password = value;


  @computed
  bool get isLoginValid{
    return validateMail() == null && validatePass() == null;
  }

  String validateMail() {
    if (email == null || email.isEmpty) {
      return "Campo obrigatório";
    } else if (!EmailValidator.validate(email)) {
      return "Este nao é um email valido";
    }

    return null;
  }

  String validatePass() {
    if (password == null || password.isEmpty) {
      return "Campo obrigatório";
    } else if (password.length < 6) {
      return "A senha necessita ter mais que do 6 caracteres";
    }

    return null;
  }


  Future login(UserModel userModel) async {
    return await authRepository.login(userModel);
  }
  
}