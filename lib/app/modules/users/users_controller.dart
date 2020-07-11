import 'package:mobx/mobx.dart';
import 'package:simex_app/app/models/user_model.dart';
import 'package:simex_app/app/modules/users/users_store.dart';

part 'users_controller.g.dart';

class UsersController = _UsersControllerBase with _$UsersController;

abstract class _UsersControllerBase with Store {
  final UserStore store;

  @observable
  ObservableFuture<List<UserModel>> users;

  _UsersControllerBase(this.store){
    users = store.userRepository.getUsers().asObservable();
  }
}
