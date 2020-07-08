import 'package:mobx/mobx.dart';

part 'pdf_store.g.dart';

class PDFStore = _PDFStoreBase with _$PDFStore;

abstract class _PDFStoreBase with Store {


  // ! CLIENTS
  @observable
  String daysContactsURL = '0';

  @action
  setDaysContactsURL(String value) {
    daysContactsURL = value;
    print(daysContactsURL);
  }

  @observable
  String daysPurchaseURL = '0';

  @action
  setDaysPurchaseURL(String value) {
    daysPurchaseURL = value;
    print(daysPurchaseURL);
  }


  //! PRODUCTS EFICIENCY

  @observable
  String initialDateProduct = '2018-06-10';

  @action
  setInitialDateProduct(String value) => initialDateProduct = value;

  @observable
  String finalDateProduct = '2020-07-07';

  @action
  setfinalDateProduct(String value) => finalDateProduct = value;
}
