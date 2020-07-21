import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/store_repository.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/core/repositories/client_repository.dart';

part 'new_client_store.g.dart';

class NewClientStore = _NewClientStoreBase with _$NewClientStore;

abstract class _NewClientStoreBase with Store {
final ClientRepository repository;
final StoreRepository storeRepository;
_NewClientStoreBase(this.repository, this.storeRepository);

Future registerClient(ClientModel model) async {
  return repository.createClient(model);
}

  cleanFields(){
    setName(null);
    setPhone(null);
    setEmail(null);
    setState(null);
    setStore(null);
    setCity(null);
    setAdress(null);
    setCPF(null);
    setCultureOne(null);
    setCultureTwo(null);
    setTotalCombine(null);
    setTotalTractor(null);
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


  @computed
  bool get isButtonValid{
    return validatePhone() == null && validateAdress() == null && validateName() == null && validateCPF() == null && validateCity() == null && validateState() == null && validateStore() == null;
  }


  String validateName() {
    if (name == null || name.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  String validateCity() {
    if (city == null || city.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  String validateState() {
    if (state == null || state.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }

    return null;
  }

  

  String validatePhone() {
    if (phone == null || phone.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }
    if (phone.length < 14){
      return "Este nao é um telefone válido";
    }

    return null;
  }

  String validateCPF() {
    if (cpf == null || cpf.isEmpty) {
      return 'Este campo não pode ficar vazio!';
    }
    if (cpf.length < 14){
      return "Este nao é um CPF válido";
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