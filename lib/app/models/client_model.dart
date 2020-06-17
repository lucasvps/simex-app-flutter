class ClientModel {
  int id;
  String code;
  String name;
  String phone;
  String email;
  String cpf;
  String adress;
  String city;
  String state;
  String store;
  int contactsDone;
  String cultureOne;
  String cultureTwo;
  int totalTractor;
  int totalCombine;
  String lastContact;
  String lastPurchase;

  ClientModel(
      {this.id,
      this.code,
      this.name,
      this.phone,
      this.email,
      this.cpf,
      this.adress,
      this.city,
      this.state,
      this.store,
      this.contactsDone,
      this.cultureOne,
      this.cultureTwo,
      this.totalTractor,
      this.totalCombine,
      this.lastContact,
      this.lastPurchase});

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    cpf = json['cpf'];
    adress = json['adress'];
    city = json['city'];
    state = json['state'];
    store = json['store'];
    contactsDone = json['contacts_done'];
    cultureOne = json['culture_one'];
    cultureTwo = json['culture_two'];
    totalTractor = json['total_tractor'];
    totalCombine = json['total_combine'];
    lastContact = json['last_contact'];
    lastPurchase = json['last_purchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    data['adress'] = this.adress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['store'] = this.store;
    data['contacts_done'] = this.contactsDone;
    data['culture_one'] = this.cultureOne;
    data['culture_two'] = this.cultureTwo;
    data['total_tractor'] = this.totalTractor;
    data['total_combine'] = this.totalCombine;
    data['last_contact'] = this.lastContact;
    data['last_purchase'] = this.lastPurchase;
    return data;
  }
}