class ClientModel {
  int id;
  String name;
  String contactName;
  String phone;
  String email;
  String birthDate;
  String cpf;
  String cnpj;
  int typeClient;
  String typeClientName;
  String cultureOne;
  String cultureTwo;
  int totalTractor;
  int totalCombine;
  Null lastContact;
  Null lastPurchase;
  int contactsDone;
  String createdAt;
  String updatedAt;

  ClientModel(
      {this.id,
      this.name,
      this.contactName,
      this.phone,
      this.email,
      this.birthDate,
      this.cpf,
      this.cnpj,
      this.typeClient,
      this.typeClientName,
      this.cultureOne,
      this.cultureTwo,
      this.totalTractor,
      this.totalCombine,
      this.lastContact,
      this.lastPurchase,
      this.contactsDone,
      this.createdAt,
      this.updatedAt});

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contactName = json['contact_name'];
    phone = json['phone'];
    email = json['email'];
    birthDate = json['birth_date'];
    cpf = json['cpf'];
    cnpj = json['cnpj'];
    typeClient = json['type_client'];
    typeClientName = json['type_client_name'];
    cultureOne = json['culture_one'];
    cultureTwo = json['culture_two'];
    totalTractor = json['total_tractor'];
    totalCombine = json['total_combine'];
    lastContact = json['last_contact'];
    lastPurchase = json['last_purchase'];
    contactsDone = json['contacts_done'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact_name'] = this.contactName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['birth_date'] = this.birthDate;
    data['cpf'] = this.cpf;
    data['cnpj'] = this.cnpj;
    data['type_client'] = this.typeClient;
    data['type_client_name'] = this.typeClientName;
    data['culture_one'] = this.cultureOne;
    data['culture_two'] = this.cultureTwo;
    data['total_tractor'] = this.totalTractor;
    data['total_combine'] = this.totalCombine;
    data['last_contact'] = this.lastContact;
    data['last_purchase'] = this.lastPurchase;
    data['contacts_done'] = this.contactsDone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}