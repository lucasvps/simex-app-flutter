// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateRegister_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateRegisterStore on _UpdateRegisterStoreBase, Store {
  Computed<bool> _$notLostButtonValidComputed;

  @override
  bool get notLostButtonValid => (_$notLostButtonValidComputed ??=
          Computed<bool>(() => super.notLostButtonValid,
              name: '_UpdateRegisterStoreBase.notLostButtonValid'))
      .value;
  Computed<bool> _$lostSellButtonValidComputed;

  @override
  bool get lostSellButtonValid => (_$lostSellButtonValidComputed ??=
          Computed<bool>(() => super.lostSellButtonValid,
              name: '_UpdateRegisterStoreBase.lostSellButtonValid'))
      .value;

  final _$currentStepAtom = Atom(name: '_UpdateRegisterStoreBase.currentStep');

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

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
  double get valueSold {
    _$valueSoldAtom.reportRead();
    return super.valueSold;
  }

  @override
  set valueSold(double value) {
    _$valueSoldAtom.reportWrite(value, super.valueSold, () {
      super.valueSold = value;
    });
  }

  final _$observationAtom = Atom(name: '_UpdateRegisterStoreBase.observation');

  @override
  String get observation {
    _$observationAtom.reportRead();
    return super.observation;
  }

  @override
  set observation(String value) {
    _$observationAtom.reportWrite(value, super.observation, () {
      super.observation = value;
    });
  }

  final _$reasonAtom = Atom(name: '_UpdateRegisterStoreBase.reason');

  @override
  String get reason {
    _$reasonAtom.reportRead();
    return super.reason;
  }

  @override
  set reason(String value) {
    _$reasonAtom.reportWrite(value, super.reason, () {
      super.reason = value;
    });
  }

  final _$nextContactAtom = Atom(name: '_UpdateRegisterStoreBase.nextContact');

  @override
  String get nextContact {
    _$nextContactAtom.reportRead();
    return super.nextContact;
  }

  @override
  set nextContact(String value) {
    _$nextContactAtom.reportWrite(value, super.nextContact, () {
      super.nextContact = value;
    });
  }

  final _$nextContactBRAtom =
      Atom(name: '_UpdateRegisterStoreBase.nextContactBR');

  @override
  String get nextContactBR {
    _$nextContactBRAtom.reportRead();
    return super.nextContactBR;
  }

  @override
  set nextContactBR(String value) {
    _$nextContactBRAtom.reportWrite(value, super.nextContactBR, () {
      super.nextContactBR = value;
    });
  }

  final _$contactFromAtom = Atom(name: '_UpdateRegisterStoreBase.contactFrom');

  @override
  String get contactFrom {
    _$contactFromAtom.reportRead();
    return super.contactFrom;
  }

  @override
  set contactFrom(String value) {
    _$contactFromAtom.reportWrite(value, super.contactFrom, () {
      super.contactFrom = value;
    });
  }

  final _$amountSoldAtom = Atom(name: '_UpdateRegisterStoreBase.amountSold');

  @override
  int get amountSold {
    _$amountSoldAtom.reportRead();
    return super.amountSold;
  }

  @override
  set amountSold(int value) {
    _$amountSoldAtom.reportWrite(value, super.amountSold, () {
      super.amountSold = value;
    });
  }

  final _$productPriceAtom =
      Atom(name: '_UpdateRegisterStoreBase.productPrice');

  @override
  String get productPrice {
    _$productPriceAtom.reportRead();
    return super.productPrice;
  }

  @override
  set productPrice(String value) {
    _$productPriceAtom.reportWrite(value, super.productPrice, () {
      super.productPrice = value;
    });
  }

  final _$prodIDAtom = Atom(name: '_UpdateRegisterStoreBase.prodID');

  @override
  String get prodID {
    _$prodIDAtom.reportRead();
    return super.prodID;
  }

  @override
  set prodID(String value) {
    _$prodIDAtom.reportWrite(value, super.prodID, () {
      super.prodID = value;
    });
  }

  final _$_UpdateRegisterStoreBaseActionController =
      ActionController(name: '_UpdateRegisterStoreBase');

  @override
  dynamic setCurrentStep(int value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setCurrentStep');
    try {
      return super.setCurrentStep(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic setValueSold(double value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setValueSold');
    try {
      return super.setValueSold(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObservation(String value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setObservation');
    try {
      return super.setObservation(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setReason(String value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setReason');
    try {
      return super.setReason(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNextContact(String value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setNextContact');
    try {
      return super.setNextContact(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNextContactBr(String value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setNextContactBr');
    try {
      return super.setNextContactBr(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContactFrom(String value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setContactFrom');
    try {
      return super.setContactFrom(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAmountSold(int value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setAmountSold');
    try {
      return super.setAmountSold(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductPrice(String value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setProductPrice');
    try {
      return super.setProductPrice(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProdId(String value) {
    final _$actionInfo = _$_UpdateRegisterStoreBaseActionController.startAction(
        name: '_UpdateRegisterStoreBase.setProdId');
    try {
      return super.setProdId(value);
    } finally {
      _$_UpdateRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStep: ${currentStep},
lostSell: ${lostSell},
efectiveSell: ${efectiveSell},
pendingSell: ${pendingSell},
status: ${status},
valueSold: ${valueSold},
observation: ${observation},
reason: ${reason},
nextContact: ${nextContact},
nextContactBR: ${nextContactBR},
contactFrom: ${contactFrom},
amountSold: ${amountSold},
productPrice: ${productPrice},
prodID: ${prodID},
notLostButtonValid: ${notLostButtonValid},
lostSellButtonValid: ${lostSellButtonValid}
    ''';
  }
}
