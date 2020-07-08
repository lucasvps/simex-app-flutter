// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportsStore on _ReportsStoreBase, Store {
  final _$choiceAtom = Atom(name: '_ReportsStoreBase.choice');

  @override
  String get choice {
    _$choiceAtom.reportRead();
    return super.choice;
  }

  @override
  set choice(String value) {
    _$choiceAtom.reportWrite(value, super.choice, () {
      super.choice = value;
    });
  }

  final _$clientsWithoutContactAtom =
      Atom(name: '_ReportsStoreBase.clientsWithoutContact');

  @override
  bool get clientsWithoutContact {
    _$clientsWithoutContactAtom.reportRead();
    return super.clientsWithoutContact;
  }

  @override
  set clientsWithoutContact(bool value) {
    _$clientsWithoutContactAtom.reportWrite(value, super.clientsWithoutContact,
        () {
      super.clientsWithoutContact = value;
    });
  }

  final _$clientsWithoutPurchaseAtom =
      Atom(name: '_ReportsStoreBase.clientsWithoutPurchase');

  @override
  bool get clientsWithoutPurchase {
    _$clientsWithoutPurchaseAtom.reportRead();
    return super.clientsWithoutPurchase;
  }

  @override
  set clientsWithoutPurchase(bool value) {
    _$clientsWithoutPurchaseAtom
        .reportWrite(value, super.clientsWithoutPurchase, () {
      super.clientsWithoutPurchase = value;
    });
  }

  final _$clientsThatSpentMoreAtom =
      Atom(name: '_ReportsStoreBase.clientsThatSpentMore');

  @override
  bool get clientsThatSpentMore {
    _$clientsThatSpentMoreAtom.reportRead();
    return super.clientsThatSpentMore;
  }

  @override
  set clientsThatSpentMore(bool value) {
    _$clientsThatSpentMoreAtom.reportWrite(value, super.clientsThatSpentMore,
        () {
      super.clientsThatSpentMore = value;
    });
  }

  final _$productEficiencyAtom =
      Atom(name: '_ReportsStoreBase.productEficiency');

  @override
  bool get productEficiency {
    _$productEficiencyAtom.reportRead();
    return super.productEficiency;
  }

  @override
  set productEficiency(bool value) {
    _$productEficiencyAtom.reportWrite(value, super.productEficiency, () {
      super.productEficiency = value;
    });
  }

  final _$enterpriseReportAtom =
      Atom(name: '_ReportsStoreBase.enterpriseReport');

  @override
  bool get enterpriseReport {
    _$enterpriseReportAtom.reportRead();
    return super.enterpriseReport;
  }

  @override
  set enterpriseReport(bool value) {
    _$enterpriseReportAtom.reportWrite(value, super.enterpriseReport, () {
      super.enterpriseReport = value;
    });
  }

  final _$userReportAtom = Atom(name: '_ReportsStoreBase.userReport');

  @override
  bool get userReport {
    _$userReportAtom.reportRead();
    return super.userReport;
  }

  @override
  set userReport(bool value) {
    _$userReportAtom.reportWrite(value, super.userReport, () {
      super.userReport = value;
    });
  }

  final _$_ReportsStoreBaseActionController =
      ActionController(name: '_ReportsStoreBase');

  @override
  dynamic setChoice(String value) {
    final _$actionInfo = _$_ReportsStoreBaseActionController.startAction(
        name: '_ReportsStoreBase.setChoice');
    try {
      return super.setChoice(value);
    } finally {
      _$_ReportsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClientsWithoutContact() {
    final _$actionInfo = _$_ReportsStoreBaseActionController.startAction(
        name: '_ReportsStoreBase.setClientsWithoutContact');
    try {
      return super.setClientsWithoutContact();
    } finally {
      _$_ReportsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClientsWithoutPurchase() {
    final _$actionInfo = _$_ReportsStoreBaseActionController.startAction(
        name: '_ReportsStoreBase.setClientsWithoutPurchase');
    try {
      return super.setClientsWithoutPurchase();
    } finally {
      _$_ReportsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClientsThatSpentMore() {
    final _$actionInfo = _$_ReportsStoreBaseActionController.startAction(
        name: '_ReportsStoreBase.setClientsThatSpentMore');
    try {
      return super.setClientsThatSpentMore();
    } finally {
      _$_ReportsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductEficiency() {
    final _$actionInfo = _$_ReportsStoreBaseActionController.startAction(
        name: '_ReportsStoreBase.setProductEficiency');
    try {
      return super.setProductEficiency();
    } finally {
      _$_ReportsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEnterpriseReport() {
    final _$actionInfo = _$_ReportsStoreBaseActionController.startAction(
        name: '_ReportsStoreBase.setEnterpriseReport');
    try {
      return super.setEnterpriseReport();
    } finally {
      _$_ReportsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserReport() {
    final _$actionInfo = _$_ReportsStoreBaseActionController.startAction(
        name: '_ReportsStoreBase.setUserReport');
    try {
      return super.setUserReport();
    } finally {
      _$_ReportsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
choice: ${choice},
clientsWithoutContact: ${clientsWithoutContact},
clientsWithoutPurchase: ${clientsWithoutPurchase},
clientsThatSpentMore: ${clientsThatSpentMore},
productEficiency: ${productEficiency},
enterpriseReport: ${enterpriseReport},
userReport: ${userReport}
    ''';
  }
}
