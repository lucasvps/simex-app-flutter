import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/clients/repositories/client_repository.dart';

part 'clients_store.g.dart';

class ClientStore = _ClientStoreBase with _$ClientStore;

abstract class _ClientStoreBase with Store {
  final ClientRepository clientRepository;

  _ClientStoreBase(this.clientRepository);


  Future searchedUserByDoc(String doc) async {
    return await clientRepository.searchedUserByDoc(doc);
  }

  Future searchedUserByName(String name) async {
    return await clientRepository.searchedUserByName(name : name);
  }

  @observable
  String searchDoc;

  @action
  setSearch(String value) => searchDoc = value;

}