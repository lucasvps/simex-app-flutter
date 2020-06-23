import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/clients/clients_store.dart';

part 'clients_controller.g.dart';

class ClientsController = _ClientsControllerBase with _$ClientsController;

abstract class _ClientsControllerBase with Store {
  final ClientStore clientStore;

  _ClientsControllerBase(this.clientStore);


  Future searchedUserByDoc(String doc) async {
    return await clientStore.searchedUserByDoc(doc);
  }


}
