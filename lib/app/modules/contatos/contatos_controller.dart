import 'package:mobx/mobx.dart';
import 'package:simex_app/app/modules/contatos/repositories/contacts_repository.dart';

part 'contatos_controller.g.dart';

class ContatosController = _ContatosControllerBase with _$ContatosController;

abstract class _ContatosControllerBase with Store {
  final ContactsRepository contactsRepository;

  _ContatosControllerBase(this.contactsRepository);

  Future contactsToday(int id) async {
    return await contactsRepository.contactsToDotoday(id);
  }

  Future contactsDoneToday() async {
    return await contactsRepository.contactsDoneToday();
  }
}
