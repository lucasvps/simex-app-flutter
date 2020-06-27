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
  double value;
  double valueSold;
  String reason;
  String nextContact;
  String phone;
  String email;
  String cpf;
  String store;
  String name;
  String productName;
  double price;

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
      this.value,
      this.valueSold,
      this.reason,
      this.nextContact,
      this.phone,
      this.email,
      this.cpf,
      this.store,
      this.name,
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
    value = json['value'];
    valueSold = json['value_sold'];
    reason = json['reason'];
    nextContact = json['next_contact'];
    phone = json['phone'];
    email = json['email'];
    cpf = json['cpf'];
    store = json['store'];
    name = json['name'];
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
    data['value'] = this.value;
    data['value_sold'] = this.valueSold;
    data['reason'] = this.reason;
    data['next_contact'] = this.nextContact;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    data['store'] = this.store;
    data['name'] = this.name;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    return data;
  }
}