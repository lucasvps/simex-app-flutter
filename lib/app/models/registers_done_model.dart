class RegistersDone {
  String dateContact;
  String status;
  String name;

  RegistersDone({this.dateContact, this.status, this.name});

  RegistersDone.fromJson(Map<String, dynamic> json) {
    dateContact = json['date_contact'];
    status = json['status'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_contact'] = this.dateContact;
    data['status'] = this.status;
    data['name'] = this.name;
    return data;
  }
}