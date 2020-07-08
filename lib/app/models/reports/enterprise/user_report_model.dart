class UserReportModel {
  List<ActivePhone> activePhone;
  List<ExternalVisit> externalVisit;
  List<ReceivedCall> receivedCall;
  List<Balcony> balcony;
  List<AmountContacts> amountContacts;
  List<ValueSoldTotal> valueSoldTotal;
  List<AmountOfEfectiveSell> amountOfEfectiveSell;

  UserReportModel(
      {this.activePhone,
      this.externalVisit,
      this.receivedCall,
      this.balcony,
      this.amountContacts,
      this.valueSoldTotal,
      this.amountOfEfectiveSell});

  UserReportModel.fromJson(Map<String, dynamic> json) {
    if (json['ActivePhone'] != null) {
      activePhone = new List<ActivePhone>();
      json['ActivePhone'].forEach((v) {
        activePhone.add(new ActivePhone.fromJson(v));
      });
    }
    if (json['ExternalVisit'] != null) {
      externalVisit = new List<ExternalVisit>();
      json['ExternalVisit'].forEach((v) {
        externalVisit.add(new ExternalVisit.fromJson(v));
      });
    }
    if (json['ReceivedCall'] != null) {
      receivedCall = new List<ReceivedCall>();
      json['ReceivedCall'].forEach((v) {
        receivedCall.add(new ReceivedCall.fromJson(v));
      });
    }
    if (json['Balcony'] != null) {
      balcony = new List<Balcony>();
      json['Balcony'].forEach((v) {
        balcony.add(new Balcony.fromJson(v));
      });
    }
    if (json['AmountContacts'] != null) {
      amountContacts = new List<AmountContacts>();
      json['AmountContacts'].forEach((v) {
        amountContacts.add(new AmountContacts.fromJson(v));
      });
    }
    if (json['ValueSoldTotal'] != null) {
      valueSoldTotal = new List<ValueSoldTotal>();
      json['ValueSoldTotal'].forEach((v) {
        valueSoldTotal.add(new ValueSoldTotal.fromJson(v));
      });
    }
    if (json['AmountOfEfectiveSell'] != null) {
      amountOfEfectiveSell = new List<AmountOfEfectiveSell>();
      json['AmountOfEfectiveSell'].forEach((v) {
        amountOfEfectiveSell.add(new AmountOfEfectiveSell.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activePhone != null) {
      data['ActivePhone'] = this.activePhone.map((v) => v.toJson()).toList();
    }
    if (this.externalVisit != null) {
      data['ExternalVisit'] =
          this.externalVisit.map((v) => v.toJson()).toList();
    }
    if (this.receivedCall != null) {
      data['ReceivedCall'] = this.receivedCall.map((v) => v.toJson()).toList();
    }
    if (this.balcony != null) {
      data['Balcony'] = this.balcony.map((v) => v.toJson()).toList();
    }
    if (this.amountContacts != null) {
      data['AmountContacts'] =
          this.amountContacts.map((v) => v.toJson()).toList();
    }
    if (this.valueSoldTotal != null) {
      data['ValueSoldTotal'] =
          this.valueSoldTotal.map((v) => v.toJson()).toList();
    }
    if (this.amountOfEfectiveSell != null) {
      data['AmountOfEfectiveSell'] =
          this.amountOfEfectiveSell.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActivePhone {
  int amount;
  String contactFrom;

  ActivePhone({this.amount, this.contactFrom});

  ActivePhone.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    contactFrom = json['contact_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['contact_from'] = this.contactFrom;
    return data;
  }
}

class ExternalVisit {
  int externalVisit;
  String contactFrom;

  ExternalVisit({this.externalVisit, this.contactFrom});

  ExternalVisit.fromJson(Map<String, dynamic> json) {
    externalVisit = json['externalVisit'];
    contactFrom = json['contact_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['externalVisit'] = this.externalVisit;
    data['contact_from'] = this.contactFrom;
    return data;
  }
}

class ReceivedCall {
  int receivedCall;
  String contactFrom;

  ReceivedCall({this.receivedCall, this.contactFrom});

  ReceivedCall.fromJson(Map<String, dynamic> json) {
    receivedCall = json['receivedCall'];
    contactFrom = json['contact_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receivedCall'] = this.receivedCall;
    data['contact_from'] = this.contactFrom;
    return data;
  }
}

class Balcony {
  int balconyContact;
  String contactFrom;

  Balcony({this.balconyContact, this.contactFrom});

  Balcony.fromJson(Map<String, dynamic> json) {
    balconyContact = json['balconyContact'];
    contactFrom = json['contact_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balconyContact'] = this.balconyContact;
    data['contact_from'] = this.contactFrom;
    return data;
  }
}

class AmountContacts {
  int amount;

  AmountContacts({this.amount});

  AmountContacts.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    return data;
  }
}

class ValueSoldTotal {
  int valueSoldTotal;

  ValueSoldTotal({this.valueSoldTotal});

  ValueSoldTotal.fromJson(Map<String, dynamic> json) {
    valueSoldTotal = json['valueSoldTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valueSoldTotal'] = this.valueSoldTotal;
    return data;
  }
}

class AmountOfEfectiveSell {
  int amountOfEfectiveSell;

  AmountOfEfectiveSell({this.amountOfEfectiveSell});

  AmountOfEfectiveSell.fromJson(Map<String, dynamic> json) {
    amountOfEfectiveSell = json['amountOfEfectiveSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountOfEfectiveSell'] = this.amountOfEfectiveSell;
    return data;
  }
}
