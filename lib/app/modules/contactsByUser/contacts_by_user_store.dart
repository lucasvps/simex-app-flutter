import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/user_repository.dart';

part 'contacts_by_user_store.g.dart';

class ContactsByUserStore = _ContactsByUserStoreBase with _$ContactsByUserStore;

abstract class _ContactsByUserStoreBase with Store {
  final UserRepository repository;
   _ContactsByUserStoreBase(this.repository);

  @observable
  String userId;

  @action
  setUserId(String value) => userId = value;

  @observable
  String initialDateChoice;

  @action
  setInitialDateChoice(String value) => initialDateChoice = value;

  @observable
  String initialDateChoiceBR;

  @action
  setInitialDateChoiceBR(String value) => initialDateChoiceBR = value;

  @observable
  String finalDateChoice;

  @action
  setFinalDateChoice(String value) => finalDateChoice = value;

  @observable
  String finalDateChoiceBR;

  @action
  setFinalDateChoiceBR(String value) => finalDateChoiceBR = value;




}