// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actives_products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivesProductsStore on _ActivesProductsStoreBase, Store {
  final _$currentPageAtom = Atom(name: '_ActivesProductsStoreBase.currentPage');

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

  final _$lastPageAtom = Atom(name: '_ActivesProductsStoreBase.lastPage');

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

  final _$_ActivesProductsStoreBaseActionController =
      ActionController(name: '_ActivesProductsStoreBase');

  @override
  dynamic setCurrentPage(String value) {
    final _$actionInfo = _$_ActivesProductsStoreBaseActionController
        .startAction(name: '_ActivesProductsStoreBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_ActivesProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastPage(String value) {
    final _$actionInfo = _$_ActivesProductsStoreBaseActionController
        .startAction(name: '_ActivesProductsStoreBase.setLastPage');
    try {
      return super.setLastPage(value);
    } finally {
      _$_ActivesProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
lastPage: ${lastPage}
    ''';
  }
}
