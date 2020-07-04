class NextContactsModel {
  int id;
  int idClient;
  int idUser;
  int productId;
  String dateContact;
  String contactFrom;
  String status;
  String observation;
  int productAmount;
  String valueSold;
  String reason;
  String nextContact;
  String name;
  String phone;
  String email;
  int totalTractor;
  int totalCombine;
  String adress;
  String city;
  String state;
  String store;
  String code;
  String cpf;
  String cultureOne;
  String cultureTwo;
  String lastContact;
  String lastPurchase;
  int contactsDone;
  String productName;
  String price;

  NextContactsModel(
      {this.id,
      this.idClient,
      this.idUser,
      this.productId,
      this.dateContact,
      this.contactFrom,
      this.status,
      this.observation,
      this.productAmount,
      this.valueSold,
      this.reason,
      this.nextContact,
      this.name,
      this.phone,
      this.email,
      this.totalTractor,
      this.totalCombine,
      this.adress,
      this.city,
      this.state,
      this.store,
      this.code,
      this.cpf,
      this.cultureOne,
      this.cultureTwo,
      this.lastContact,
      this.lastPurchase,
      this.contactsDone,
      this.productName,
      this.price});

  NextContactsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idClient = json['id_client'];
    idUser = json['id_user'];
    productId = json['product_id'];
    dateContact = json['date_contact'];
    contactFrom = json['contact_from'];
    status = json['status'];
    observation = json['observation'];
    productAmount = json['product_amount'];
    valueSold = json['value_sold'];
    reason = json['reason'];
    nextContact = json['next_contact'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    totalTractor = json['total_tractor'];
    totalCombine = json['total_combine'];
    adress = json['adress'];
    city = json['city'];
    state = json['state'];
    store = json['store'];
    code = json['code'];
    cpf = json['cpf'];
    cultureOne = json['culture_one'];
    cultureTwo = json['culture_two'];
    lastContact = json['last_contact'];
    lastPurchase = json['last_purchase'];
    contactsDone = json['contacts_done'];
    productName = json['product_name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_client'] = this.idClient;
    data['id_user'] = this.idUser;
    data['product_id'] = this.productId;
    data['date_contact'] = this.dateContact;
    data['contact_from'] = this.contactFrom;
    data['status'] = this.status;
    data['observation'] = this.observation;
    data['product_amount'] = this.productAmount;
    data['value_sold'] = this.valueSold;
    data['reason'] = this.reason;
    data['next_contact'] = this.nextContact;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['total_tractor'] = this.totalTractor;
    data['total_combine'] = this.totalCombine;
    data['adress'] = this.adress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['store'] = this.store;
    data['code'] = this.code;
    data['cpf'] = this.cpf;
    data['culture_one'] = this.cultureOne;
    data['culture_two'] = this.cultureTwo;
    data['last_contact'] = this.lastContact;
    data['last_purchase'] = this.lastPurchase;
    data['contacts_done'] = this.contactsDone;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    return data;
  }
}