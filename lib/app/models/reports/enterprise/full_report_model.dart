class ActivePhoneModel {
  int amount;
  String name;
  String valueSold;

  ActivePhoneModel({this.amount, this.name, this.valueSold});

  ActivePhoneModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    name = json['name'];
    valueSold = json['valueSold'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['name'] = this.name;
    data['valueSold'] = this.valueSold;
    return data;
  }
}

class ReceivedCallModel{
  int amount;
  String name;
  String valueSold;

  ReceivedCallModel({this.amount, this.name, this.valueSold});

  ReceivedCallModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    name = json['name'];
    valueSold = json['valueSold'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['name'] = this.name;
    data['valueSold'] = this.valueSold;
    return data;
  }
}

class ExternalVisitModel{
  int amount;
  String name;
  String valueSold;

  ExternalVisitModel({this.amount, this.name, this.valueSold});

  ExternalVisitModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    name = json['name'];
    valueSold = json['valueSold'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['name'] = this.name;
    data['valueSold'] = this.valueSold;
    return data;
  }
}

class BalconyContactModel{
  int amount;
  String name;
  String valueSold;

  BalconyContactModel({this.amount, this.name, this.valueSold});

  BalconyContactModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    name = json['name'];
    valueSold = json['valueSold'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['name'] = this.name;
    data['valueSold'] = this.valueSold;
    return data;
  }
}