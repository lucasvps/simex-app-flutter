class RegisterModel {
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

  RegisterModel(
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
      this.nextContact});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}