import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/clients/repositories/client_repository.dart';

part 'clients_controller.g.dart';

class ClientsController = _ClientsControllerBase with _$ClientsController;

abstract class _ClientsControllerBase with Store {
  final ClientRepository clientRepository;

  _ClientsControllerBase(this.clientRepository);


  Future searchedUserByDoc(String doc) async {
    return await clientRepository.searchedUserByDoc(doc);
  }

  @observable
  String searchDoc;

  @action
  setSearch(String value) => searchDoc = value;
}
