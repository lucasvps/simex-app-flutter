class ContactsDoneModel {
  String status;
  String name;
  String valueSold;
  String observation;
  String reason;
  String contactFrom;
  int productAmount;

  ContactsDoneModel(
      {this.status,
      this.name,
      this.valueSold,
      this.observation,
      this.reason,
      this.contactFrom,
      this.productAmount});

  ContactsDoneModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    valueSold = json['value_sold'];
    observation = json['observation'];
    reason = json['reason'];
    contactFrom = json['contact_from'];
    productAmount = json['product_amount'];
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
    return data;
  }
}