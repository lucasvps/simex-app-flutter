import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';

part 'registers_done_store.g.dart';

class RegistersDoneStore = _RegistersDoneStoreBase with _$RegistersDoneStore;

abstract class _RegistersDoneStoreBase with Store {
  final RegisterRepository registerRepository;

  _RegistersDoneStoreBase(this.registerRepository);
}