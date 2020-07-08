// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PDFStore on _PDFStoreBase, Store {
  final _$daysContactsURLAtom = Atom(name: '_PDFStoreBase.daysContactsURL');

  @override
  String get daysContactsURL {
    _$daysContactsURLAtom.reportRead();
    return super.daysContactsURL;
  }

  @override
  set daysContactsURL(String value) {
    _$daysContactsURLAtom.reportWrite(value, super.daysContactsURL, () {
      super.daysContactsURL = value;
    });
  }

  final _$daysPurchaseURLAtom = Atom(name: '_PDFStoreBase.daysPurchaseURL');

  @override
  String get daysPurchaseURL {
    _$daysPurchaseURLAtom.reportRead();
    return super.daysPurchaseURL;
  }

  @override
  set daysPurchaseURL(String value) {
    _$daysPurchaseURLAtom.reportWrite(value, super.daysPurchaseURL, () {
      super.daysPurchaseURL = value;
    });
  }

  final _$initialDateProductAtom =
      Atom(name: '_PDFStoreBase.initialDateProduct');

  @override
  String get initialDateProduct {
    _$initialDateProductAtom.reportRead();
    return super.initialDateProduct;
  }

  @override
  set initialDateProduct(String value) {
    _$initialDateProductAtom.reportWrite(value, super.initialDateProduct, () {
      super.initialDateProduct = value;
    });
  }

  final _$finalDateProductAtom = Atom(name: '_PDFStoreBase.finalDateProduct');

  @override
  String get finalDateProduct {
    _$finalDateProductAtom.reportRead();
    return super.finalDateProduct;
  }

  @override
  set finalDateProduct(String value) {
    _$finalDateProductAtom.reportWrite(value, super.finalDateProduct, () {
      super.finalDateProduct = value;
    });
  }

  final _$_PDFStoreBaseActionController =
      ActionController(name: '_PDFStoreBase');

  @override
  dynamic setDaysContactsURL(String value) {
    final _$actionInfo = _$_PDFStoreBaseActionController.startAction(
        name: '_PDFStoreBase.setDaysContactsURL');
    try {
      return super.setDaysContactsURL(value);
    } finally {
      _$_PDFStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDaysPurchaseURL(String value) {
    final _$actionInfo = _$_PDFStoreBaseActionController.startAction(
        name: '_PDFStoreBase.setDaysPurchaseURL');
    try {
      return super.setDaysPurchaseURL(value);
    } finally {
      _$_PDFStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitialDateProduct(String value) {
    final _$actionInfo = _$_PDFStoreBaseActionController.startAction(
        name: '_PDFStoreBase.setInitialDateProduct');
    try {
      return super.setInitialDateProduct(value);
    } finally {
      _$_PDFStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setfinalDateProduct(String value) {
    final _$actionInfo = _$_PDFStoreBaseActionController.startAction(
        name: '_PDFStoreBase.setfinalDateProduct');
    try {
      return super.setfinalDateProduct(value);
    } finally {
      _$_PDFStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
daysContactsURL: ${daysContactsURL},
daysPurchaseURL: ${daysPurchaseURL},
initialDateProduct: ${initialDateProduct},
finalDateProduct: ${finalDateProduct}
    ''';
  }
}
