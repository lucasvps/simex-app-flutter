// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_by_store_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientsByStoreStore on _ClientsByStoreStoreBase, Store {
  final _$clientStoreAtom = Atom(name: '_ClientsByStoreStoreBase.clientStore');

  @override
  String get clientStore {
    _$clientStoreAtom.reportRead();
    return super.clientStore;
  }

  @override
  set clientStore(String value) {
    _$clientStoreAtom.reportWrite(value, super.clientStore, () {
      super.clientStore = value;
    });
  }

  final _$lastPurchaseYearAtom =
      Atom(name: '_ClientsByStoreStoreBase.lastPurchaseYear');

  @override
  String get lastPurchaseYear {
    _$lastPurchaseYearAtom.reportRead();
    return super.lastPurchaseYear;
  }

  @override
  set lastPurchaseYear(String value) {
    _$lastPurchaseYearAtom.reportWrite(value, super.lastPurchaseYear, () {
      super.lastPurchaseYear = value;
    });
  }

  final _$currentPageAtom = Atom(name: '_ClientsByStoreStoreBase.currentPage');

  @override
  String get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(String value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$lastPageAtom = Atom(name: '_ClientsByStoreStoreBase.lastPage');

  @override
  String get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(String value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  final _$_ClientsByStoreStoreBaseActionController =
      ActionController(name: '_ClientsByStoreStoreBase');

  @override
  dynamic setClientStore(String value) {
    final _$actionInfo = _$_ClientsByStoreStoreBaseActionController.startAction(
        name: '_ClientsByStoreStoreBase.setClientStore');
    try {
      return super.setClientStore(value);
    } finally {
      _$_ClientsByStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastPurchaseYear(String value) {
    final _$actionInfo = _$_ClientsByStoreStoreBaseActionController.startAction(
        name: '_ClientsByStoreStoreBase.setLastPurchaseYear');
    try {
      return super.setLastPurchaseYear(value);
    } finally {
      _$_ClientsByStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentPage(String value) {
    final _$actionInfo = _$_ClientsByStoreStoreBaseActionController.startAction(
        name: '_ClientsByStoreStoreBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_ClientsByStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastPage(String value) {
    final _$actionInfo = _$_ClientsByStoreStoreBaseActionController.startAction(
        name: '_ClientsByStoreStoreBase.setLastPage');
    try {
      return super.setLastPage(value);
    } finally {
      _$_ClientsByStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientStore: ${clientStore},
lastPurchaseYear: ${lastPurchaseYear},
currentPage: ${currentPage},
lastPage: ${lastPage}
    ''';
  }
}
