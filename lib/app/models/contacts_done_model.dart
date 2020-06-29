class ContactsDoneModel {
  String status;
  String name;
  String valueSold;
  String reason;
  String observation;

  ContactsDoneModel(
      {this.status, this.name, this.valueSold, this.reason, this.observation});

  ContactsDoneModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    valueSold = json['value_sold'];
    reason = json['reason'];
    observation = json['observation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['name'] = this.name;
    data['value_sold'] = this.valueSold;
    data['reason'] = this.reason;
    data['observation'] = this.observation;
    return data;
  }
}