import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/user_repository.dart';

part 'users_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final UserRepository userRepository;

  _UserStoreBase(this.userRepository);


}