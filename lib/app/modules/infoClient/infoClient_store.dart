import 'package:mobx/mobx.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/modules/clients/repositories/client_repository.dart';

part 'infoClient_store.g.dart';

class InfoClientStore = _InfoClientStoreBase with _$InfoClientStore;

abstract class _InfoClientStoreBase with Store {

  final ClientRepository clientRepository;
  _InfoClientStoreBase(this.clientRepository);

  Future updateClient(int id, ClientModel clientModel) async {
    return await clientRepository.updateClient(id, clientModel);
  }

  
  @observable
  String name;

  @action
  setName(String value) => name = value;

  @observable
  String phone;

  @action
  setPhone(String value) => phone = value;

  @observable
  String email;

  @action
  setEmail(String value) => email = value;


  @observable
  String cpf;

  @action
  setCPF(String value) => cpf = value;


  @observable
  String adress;

  @action
  setAdress(String value) => adress = value;


  @observable
  String city;

  @action
  setCity(String value) => city = value;


  @observable
  String state;

  @action
  setState(String value) => state = value;


  @observable
  String store;

  @action
  setStore(String value) => store = value;


  @observable
  String contactsDone;

  @action
  setContactsDone(String value) => contactsDone = value;


  @observable
  String cultureOne;

  @action
  setCultureOne(String value) => cultureOne = value;

  @observable
  String cultureTwo;

  @action
  setCultureTwo(String value) => cultureTwo = value;

  @observable
  String totalTractor;

  @action
  setTotalTractor(String value) => totalTractor = value;

  @observable
  String totalCombine;

  @action
  setTotalCombine(String value) => totalCombine = value;


  clearField(){
    name = null;
    email = null;
    phone = null;
    cpf = null;
    adress = null;
    city = null;
    state = null;
    contactsDone = null;
    cultureOne = null;
    cultureTwo = null;
    totalTractor = null;
    totalCombine = null;
  }


  String validateName() {
    if (name == null || name.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  String validatePhone() {
    if (phone == null || phone.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  String validateCPF() {
    if (cpf == null || cpf.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  String validateAdress() {
    if (adress == null || adress.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  String validateStore() {
    if (store == null || store.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }



}