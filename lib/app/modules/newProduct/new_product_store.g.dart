// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewProductStore on _NewProductStoreBase, Store {
  Computed<bool> _$isButtonValidComputed;

  @override
  bool get isButtonValid =>
      (_$isButtonValidComputed ??= Computed<bool>(() => super.isButtonValid,
              name: '_NewProductStoreBase.isButtonValid'))
          .value;

  final _$nameAtom = Atom(name: '_NewProductStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$priceAtom = Atom(name: '_NewProductStoreBase.price');

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$initialDateAtom = Atom(name: '_NewProductStoreBase.initialDate');

  @override
  String get initialDate {
    _$initialDateAtom.reportRead();
    return super.initialDate;
  }

  @override
  set initialDate(String value) {
    _$initialDateAtom.reportWrite(value, super.initialDate, () {
      super.initialDate = value;
    });
  }

  final _$finalDateAtom = Atom(name: '_NewProductStoreBase.finalDate');

  @override
  String get finalDate {
    _$finalDateAtom.reportRead();
    return super.finalDate;
  }

  @override
  set finalDate(String value) {
    _$finalDateAtom.reportWrite(value, super.finalDate, () {
      super.finalDate = value;
    });
  }

  final _$initialDateBRAtom = Atom(name: '_NewProductStoreBase.initialDateBR');

  @override
  String get initialDateBR {
    _$initialDateBRAtom.reportRead();
    return super.initialDateBR;
  }

  @override
  set initialDateBR(String value) {
    _$initialDateBRAtom.reportWrite(value, super.initialDateBR, () {
      super.initialDateBR = value;
    });
  }

  final _$finalDateBRAtom = Atom(name: '_NewProductStoreBase.finalDateBR');

  @override
  String get finalDateBR {
    _$finalDateBRAtom.reportRead();
    return super.finalDateBR;
  }

  @override
  set finalDateBR(String value) {
    _$finalDateBRAtom.reportWrite(value, super.finalDateBR, () {
      super.finalDateBR = value;
    });
  }

  final _$_NewProductStoreBaseActionController =
      ActionController(name: '_NewProductStoreBase');

  @override
  dynamic setProductName(String value) {
    final _$actionInfo = _$_NewProductStoreBaseActionController.startAction(
        name: '_NewProductStoreBase.setProductName');
    try {
      return super.setProductName(value);
    } finally {
      _$_NewProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductPrice(String value) {
    final _$actionInfo = _$_NewProductStoreBaseActionController.startAction(
        name: '_NewProductStoreBase.setProductPrice');
    try {
      return super.setProductPrice(value);
    } finally {
      _$_NewProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitialDate(String value) {
    final _$actionInfo = _$_NewProductStoreBaseActionController.startAction(
        name: '_NewProductStoreBase.setInitialDate');
    try {
      return super.setInitialDate(value);
    } finally {
      _$_NewProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinalDate(String value) {
    final _$actionInfo = _$_NewProductStoreBaseActionController.startAction(
        name: '_NewProductStoreBase.setFinalDate');
    try {
      return super.setFinalDate(value);
    } finally {
      _$_NewProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitialDateBR(String value) {
    final _$actionInfo = _$_NewProductStoreBaseActionController.startAction(
        name: '_NewProductStoreBase.setInitialDateBR');
    try {
      return super.setInitialDateBR(value);
    } finally {
      _$_NewProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinalDateBR(String value) {
    final _$actionInfo = _$_NewProductStoreBaseActionController.startAction(
        name: '_NewProductStoreBase.setFinalDateBR');
    try {
      return super.setFinalDateBR(value);
    } finally {
      _$_NewProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
price: ${price},
initialDate: ${initialDate},
finalDate: ${finalDate},
initialDateBR: ${initialDateBR},
finalDateBR: ${finalDateBR},
isButtonValid: ${isButtonValid}
    ''';
  }
}
