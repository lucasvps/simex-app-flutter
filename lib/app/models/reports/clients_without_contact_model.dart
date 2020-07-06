class ClientsWithoutContact {
  String name;
  String cpf;
  String phone;
  String lastContact;

  ClientsWithoutContact({this.name, this.cpf, this.phone, this.lastContact});

  ClientsWithoutContact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    phone = json['phone'];
    lastContact = json['last_contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    data['phone'] = this.phone;
    data['last_contact'] = this.lastContact;
    return data;
  }
}