class NextContactsModel {
  int id;
  int idClient;
  int idUser;
  String clientName;
  String dateContact;
  String contactFrom;
  String status;
  String observation;
  String productName;
  int value;
  int valueSold;
  String reason;
  String nextContact;
  String phone;
  String email;
  String cpf;
  String store;
  String name;

  NextContactsModel(
      {this.id,
      this.idClient,
      this.idUser,
      this.clientName,
      this.dateContact,
      this.contactFrom,
      this.status,
      this.observation,
      this.productName,
      this.value,
      this.valueSold,
      this.reason,
      this.nextContact,
      this.phone,
      this.email,
      this.cpf,
      this.store,
      this.name});

  NextContactsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idClient = json['id_client'];
    idUser = json['id_user'];
    clientName = json['client_name'];
    dateContact = json['date_contact'];
    contactFrom = json['contact_from'];
    status = json['status'];
    observation = json['observation'];
    productName = json['product_name'];
    value = json['value'];
    valueSold = json['value_sold'];
    reason = json['reason'];
    nextContact = json['next_contact'];
    phone = json['phone'];
    email = json['email'];
    cpf = json['cpf'];
    store = json['store'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_client'] = this.idClient;
    data['id_user'] = this.idUser;
    data['client_name'] = this.clientName;
    data['date_contact'] = this.dateContact;
    data['contact_from'] = this.contactFrom;
    data['status'] = this.status;
    data['observation'] = this.observation;
    data['product_name'] = this.productName;
    data['value'] = this.value;
    data['value_sold'] = this.valueSold;
    data['reason'] = this.reason;
    data['next_contact'] = this.nextContact;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    data['store'] = this.store;
    data['name'] = this.name;
    return data;
  }
}