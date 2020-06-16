class NextContactsModel {
  int id;
  String name;
  String contactName;
  String phone;

  NextContactsModel({this.id, this.name, this.contactName, this.phone});

  NextContactsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contactName = json['contact_name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact_name'] = this.contactName;
    data['phone'] = this.phone;
    return data;
  }
}