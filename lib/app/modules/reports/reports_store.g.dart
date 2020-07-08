// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportsStore on _ReportsStoreBase, Store {
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

  final _$_ReportsStoreBaseActionController =
      ActionController(name: '_ReportsStoreBase');

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
  String toString() {
    return '''
clientsWithoutContact: ${clientsWithoutContact},
clientsWithoutPurchase: ${clientsWithoutPurchase}
    ''';
  }
}
