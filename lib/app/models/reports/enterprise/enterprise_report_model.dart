class EnterpriseReportModel {
  List<ActivePhone> activePhone;
  List<ExternalVisit> externalVisit;
  List<ReceivedCall> receivedCall;
  List<Balcony> balcony;
  List<AmountContacts> amountContacts;
  List<ValueSold> valueSold;
  List<AmountEfectiveSell> amountEfectiveSell;

  EnterpriseReportModel(
      {this.activePhone,
      this.externalVisit,
      this.receivedCall,
      this.balcony,
      this.amountContacts,
      this.valueSold,
      this.amountEfectiveSell});

  EnterpriseReportModel.fromJson(Map<String, dynamic> json) {
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
    if (json['ValueSold'] != null) {
      valueSold = new List<ValueSold>();
      json['ValueSold'].forEach((v) {
        valueSold.add(new ValueSold.fromJson(v));
      });
    }
    if (json['AmountEfectiveSell'] != null) {
      amountEfectiveSell = new List<AmountEfectiveSell>();
      json['AmountEfectiveSell'].forEach((v) {
        amountEfectiveSell.add(new AmountEfectiveSell.fromJson(v));
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
    if (this.valueSold != null) {
      data['ValueSold'] = this.valueSold.map((v) => v.toJson()).toList();
    }
    if (this.amountEfectiveSell != null) {
      data['AmountEfectiveSell'] =
          this.amountEfectiveSell.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActivePhone {
  int activePhone;
  String contactFrom;

  ActivePhone({this.activePhone, this.contactFrom});

  ActivePhone.fromJson(Map<String, dynamic> json) {
    activePhone = json['activePhone'];
    contactFrom = json['contact_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activePhone'] = this.activePhone;
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
  int total;

  AmountContacts({this.total});

  AmountContacts.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}

class ValueSold {
  int valueSoldTotal;

  ValueSold({this.valueSoldTotal});

  ValueSold.fromJson(Map<String, dynamic> json) {
    valueSoldTotal = json['valueSoldTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valueSoldTotal'] = this.valueSoldTotal;
    return data;
  }
}

class AmountEfectiveSell {
  int amountOfEfectiveSell;

  AmountEfectiveSell({this.amountOfEfectiveSell});

  AmountEfectiveSell.fromJson(Map<String, dynamic> json) {
    amountOfEfectiveSell = json['amountOfEfectiveSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountOfEfectiveSell'] = this.amountOfEfectiveSell;
    return data;
  }
}