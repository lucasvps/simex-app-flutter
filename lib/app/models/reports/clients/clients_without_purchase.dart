class ClientsWithoutPurchase {
  String name;
  String cpf;
  String phone;
  String lastPurchase;

  ClientsWithoutPurchase({this.name, this.cpf, this.phone, this.lastPurchase});

  ClientsWithoutPurchase.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    phone = json['phone'];
    lastPurchase = json['last_purchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    data['phone'] = this.phone;
    data['last_purchase'] = this.lastPurchase;
    return data;
  }
}