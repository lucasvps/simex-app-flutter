import 'package:mobx/mobx.dart';

part 'pdf_store.g.dart';

class PDFStore = _PDFStoreBase with _$PDFStore;

abstract class _PDFStoreBase with Store {


  cleanField(){
    setDaysContactsURL('0');
    setDaysPurchaseURL('0');
    setInitialDateEnterprise(null);
    setInitialDateProduct(null);
    setInitialDateProductBR(null);
    setInitialDateEnterpriseBR(null);

    setfinalDateEnterprise(null);
    setfinalDateProduct(null);
    setfinalDateProductBR(null);
    setfinalDateEnterpriseBR(null);
  }

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
  String initialDateProduct;

  @action
  setInitialDateProduct(String value) => initialDateProduct = value;

  @observable
  String finalDateProduct;

  @action
  setfinalDateProduct(String value) => finalDateProduct = value;

  @observable
  String initialDateProductBR;

  @action
  setInitialDateProductBR(String value) => initialDateProductBR = value;

  @observable
  String finalDateProductBR;

  @action
  setfinalDateProductBR(String value) => finalDateProductBR = value;

  //! ENTERPRISE REPORT

  @observable
  String initialDateEnterprise;

  @action
  setInitialDateEnterprise(String value) => initialDateEnterprise = value;

  @observable
  String finalDateEnterprise;

  @action
  setfinalDateEnterprise(String value) => finalDateEnterprise = value;

  @observable
  String initialDateEnterpriseBR;

  @action
  setInitialDateEnterpriseBR(String value) => initialDateEnterpriseBR = value;

  @observable
  String finalDateEnterpriseBR;

  @action
  setfinalDateEnterpriseBR(String value) => finalDateEnterpriseBR = value;

  //! USER REPORT

  @observable
  String idUser;

  @action
  setUserID(String value) => idUser = value;

  @observable
  String userName;

  @action
  setUserName(String value) => userName = value;

  @observable
  String initialDateUser;

  @action
  setInitialDateUser(String value) => initialDateUser = value;

  @observable
  String finalDateUser;

  @action
  setfinalDateUser(String value) => finalDateUser = value;

  @observable
  String initialDateUserBR;

  @action
  setInitialDateUserBR(String value) => initialDateUserBR = value;

  @observable
  String finalDateUserBR;

  @action
  setfinalDateUserBR(String value) => finalDateUserBR = value;



  //! ---- FULL REPORT USER DATES

  @observable
  String initialDateFullBR;

  @action
  setInitialDateFullBR(String value) => initialDateFullBR = value;

  @observable
  String finalDateFullBR;

  @action
  setfinalDateFullBR(String value) => finalDateFullBR = value;

  @observable
  String initialDateFull;

  @action
  setInitialDateFull(String value) => initialDateFull = value;

  @observable
  String finalDateFull;

  @action
  setfinalDateFull(String value) => finalDateFull = value;

}

