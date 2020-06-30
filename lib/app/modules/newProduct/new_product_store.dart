import 'package:mobx/mobx.dart';
import 'package:simex_app/app/core/repositories/product_repository.dart';

part 'new_product_store.g.dart';

class NewProductStore = _NewProductStoreBase with _$NewProductStore;

abstract class _NewProductStoreBase with Store {
  final ProductRepository repository;
  _NewProductStoreBase(this.repository);

  @observable
  String name;

  @action
  setProductName(String value) => name = value;

  @observable
  String price;

  @action
  setProductPrice(String value) => price = value;

  @observable
  String initialDate;

  @action
  setInitialDate(String value) => initialDate = value;

  @observable
  String finalDate;

  @action
  setFinalDate(String value) => finalDate = value;

  @observable
  String initialDateBR;

  @action
  setInitialDateBR(String value) => initialDateBR = value;

  @observable
  String finalDateBR;

  @action
  setFinalDateBR(String value) => finalDateBR = value;

  String validateProdName() {
    if (name == null || name.isEmpty) {
      return "Campo obrigatório";
    } else if (name.length < 3) {
      return "O nome precisa ter mais de 3 caracteres";
    }

    return null;
  }

  String validateProdPrice() {
    if (price == null || price.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String validateInitialDate() {
    if (initialDate == null || initialDate.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String validateFinalDate() {
    if (finalDate == null || finalDate.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  @computed
  bool get isButtonValid {
    return validateProdName() == null &&
        validateProdPrice() == null &&
        validateInitialDate() == null &&
        validateFinalDate() == null;
  }

  cleanFields() {
    
    setInitialDateBR(null);
    setInitialDate(null);
    setFinalDateBR(null);
    setFinalDate(null);
  }
}
