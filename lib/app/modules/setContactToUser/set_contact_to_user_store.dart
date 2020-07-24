import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/client_repository.dart';
import 'package:simex_app/app/core/repositories/register_repository.dart';
import 'package:simex_app/app/core/repositories/user_repository.dart';
import 'package:simex_app/app/models/client_model.dart';
import 'package:simex_app/app/models/register_model.dart';

part 'set_contact_to_user_store.g.dart';

class SetContactsToUserStore = _SetContactsToUserStoreBase with _$SetContactsToUserStore;

abstract class _SetContactsToUserStoreBase with Store {
  final ClientRepository repository;
  final UserRepository userRepository;
  final RegisterRepository registerRepository;
  _SetContactsToUserStoreBase(this.repository, this.userRepository, this.registerRepository);


  @observable
  String dateChoice;

  @action
  setDateChoice(String value) => dateChoice = value;

  @observable
  String dateChoiceBR;

  @action
  setDateChoiceBR(String value) => dateChoiceBR = value;

  @observable
  String userId;

  @action
  setUserId(String value) => userId = value;

  @observable
  String userName;

  @action
  setUserName(String value) => userName = value;

  @observable
  String clientStore;


  @action
  setClientStore(String value) => clientStore = value;

  @observable
  String lastPurchaseYear;

  @action
  setLastPurchaseYear(String value) => lastPurchaseYear = value;

  @observable
  String currentPage = '1';

  @action
  setCurrentPage(String value) => currentPage = value;

  @observable
  String lastPage;

  @action
  setLastPage(String value) => lastPage = value;

  @observable
  List<ClientModel> clients = [];

  @action
  addToList(ClientModel client){
    clients.add(client);
    print(clients);
  }

  @observable
  List<int> idClientsSelected = [];

  @action
  setListToNull(List list) => list.clear();

  @action
  addToListId(int id){
    if(!idClientsSelected.contains(id)){
      idClientsSelected.add(id);
    } else {
      idClientsSelected.remove(id);
    }
    print(idClientsSelected);
  }


  @action
  createAllRegisters(List<int> list){
    for (var id in list){
      RegisterModel model = RegisterModel(
        idClient: id,
        idUser: int.parse(userId),
        contactFrom: "Gerente",
        dateContact: "2020-07-21",
        nextContact: dateChoice,
        observation: "",
        productAmount: 0,
        productId: null,
        reason: "",
        status: "Contato",
        valueSold: '0.0'
      );
      print(model.toJson());
      registerRepository.createRegister(model).then((value){
        //print('Sucess!\n');
      });
    }

    Modular.to.pushReplacementNamed('/contacts');
  }
  
}