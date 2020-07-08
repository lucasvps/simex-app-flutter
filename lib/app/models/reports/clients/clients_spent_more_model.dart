class ClientsSpentMore {
  String name;
  String cpf;
  String phone;
  String valueSpent;

  ClientsSpentMore({this.name, this.cpf, this.phone, this.valueSpent});

  ClientsSpentMore.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    phone = json['phone'];
    valueSpent = json['value_spent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    data['phone'] = this.phone;
    data['value_spent'] = this.valueSpent;
    return data;
  }
}