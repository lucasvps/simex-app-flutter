import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/client_repository.dart';

part 'clients_store.g.dart';

class ClientStore = _ClientStoreBase with _$ClientStore;

abstract class _ClientStoreBase with Store {
  final ClientRepository clientRepository;

  _ClientStoreBase(this.clientRepository);

  @observable
  String currentPage = '1';

  @action
  setCurrentPage(String value) => currentPage = value;

  @observable
  String lastPage = '1';

  @action
  setLastPage(String value) {
    lastPage = value;
    print(lastPage);
  }

  Future searchedUserByDoc(String doc) async {
    return await clientRepository.searchedUserByDoc(doc);
  }

  Future searchedUserByName(String name, String page) async {
    return await clientRepository.searchedUserByName(name: name, page: page);
  }

  @observable
  String searchDoc;

  @action
  setSearch(String value) {
    searchDoc = value;
    print(searchDoc);
  }
}
