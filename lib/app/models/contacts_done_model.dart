class ContactsDoneModel {
  String status;
  String name;
  String valueSold;
  String observation;
  String reason;
  String contactFrom;
  int productAmount;
  String nextContact;
  String dateContact;

  ContactsDoneModel(
      {this.status,
      this.name,
      this.valueSold,
      this.observation,
      this.reason,
      this.contactFrom,
      this.productAmount,
      this.nextContact,
      this.dateContact});

  ContactsDoneModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    valueSold = json['value_sold'];
    observation = json['observation'];
    reason = json['reason'];
    contactFrom = json['contact_from'];
    productAmount = json['product_amount'];
    nextContact = json['next_contact'];
    dateContact = json['date_contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['name'] = this.name;
    data['value_sold'] = this.valueSold;
    data['observation'] = this.observation;
    data['reason'] = this.reason;
    data['contact_from'] = this.contactFrom;
    data['product_amount'] = this.productAmount;
    data['next_contact'] = this.nextContact;
    data['date_contact'] = this.dateContact;
    return data;
  }
}