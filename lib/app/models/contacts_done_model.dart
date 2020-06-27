class ContactsDoneModel {
  String status;
  String name;
  double valueSold;
  String reason;
  double value;

  ContactsDoneModel(
      {this.status, this.name, this.valueSold, this.reason, this.value});

  ContactsDoneModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    valueSold = json['value_sold'];
    reason = json['reason'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['name'] = this.name;
    data['value_sold'] = this.valueSold;
    data['reason'] = this.reason;
    data['value'] = this.value;
    return data;
  }
}