// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateRegister_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateRegisterStore on _UpdateRegisterStoreBase, Store {
  final _$lostSellAtom = Atom(name: '_UpdateRegisterStoreBase.lostSell');

  @override
  bool get lostSell {
    _$lostSellAtom.reportRead();
    return super.lostSell;
  }

  @override
  set lostSell(bool value) {
    _$lostSellAtom.reportWrite(value, super.lostSell, () {
      super.lostSell = value;
    });
  }

  final _$efectiveSellAtom =
      Atom(name: '_UpdateRegisterStoreBase.efectiveSell');

  @override
  bool get efectiveSell {
    _$efectiveSellAtom.reportRead();
    return super.efectiveSell;
  }

  @override
  set efectiveSell(bool value) {
    _$efectiveSellAtom.reportWrite(value, super.efectiveSell, () {
      super.efectiveSell = value;
    });
  }

  final _$pendingSellAtom = Atom(name: '_UpdateRegisterStoreBase.pendingSell');

  @override
  bool get pendingSell {
    _$pendingSellAtom.reportRead();
    return super.pendingSell;
  }

  @override
  set pendingSell(bool value) {
    _$pendingSellAtom.reportWrite(value, super.pendingSell, () {
      super.pendingSell = value;
    });
  }

  final _$statusAtom = Atom(name: '_UpdateRegisterStoreBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$valueSoldAtom = Atom(name: '_UpdateRegisterStoreBase.valueSold');

  @override
  int get valueSold {
    _$valueSoldAtom.reportRead();
    return super.valueSold;
  }

  @override
  set valueSold(int value) {
    _$valueSoldAtom.reportWrite(value, super.valueSold, () {
      super.valueSold = value;
    });
  }

  final _$_UpdateRegisterStoreBaseActionController =
      ActionController(name: '_UpdateRegisterStoreBase');

  @override
  dynamic setStatus(String value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValueSold(int value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setValueSold');
    try {
      return super.setValueSold(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lostSell: ${lostSell},
efectiveSell: ${efectiveSell},
pendingSell: ${pendingSell},
status: ${status},
valueSold: ${valueSold}
    ''';
  }
}
