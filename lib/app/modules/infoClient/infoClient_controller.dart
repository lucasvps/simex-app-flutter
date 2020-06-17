import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_store.dart';

part 'infoClient_controller.g.dart';

class InfoClientController = _InfoClientControllerBase
    with _$InfoClientController;

abstract class _InfoClientControllerBase with Store {
  final InfoClientStore infoClientStore;

  _InfoClientControllerBase(this.infoClientStore);


  String validateName(){
    return infoClientStore.validateName();
  }

  String validatePhone(){
    return infoClientStore.validatePhone();
  }

  String validateCPF(){
    return infoClientStore.validateCPF();
  }

  String validateAdress(){
    return infoClientStore.validateAdress();
  }

  String validateStore(){
    return infoClientStore.validateStore();
  }
  
}
