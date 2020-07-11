import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/reportsRepositories/products_report_repository.dart';
import 'package:simex_app/app/core/repositories/contacts_repository.dart';
import 'package:simex_app/app/modules/pdf/pdf_store.dart';

part 'contatos_controller.g.dart';

class ContatosController = _ContatosControllerBase with _$ContatosController;

abstract class _ContatosControllerBase with Store {
  final ContactsRepository contactsRepository;
  final PDFStore store;

  _ContatosControllerBase(this.contactsRepository, this.store);

  Future contactsToday(int id) async {
    return await contactsRepository.contactsToDotoday(id);
  }

  Future contactsDoneToday() async {
    return await contactsRepository.contactsDoneToday();
  }
}
