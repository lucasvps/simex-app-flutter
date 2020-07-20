// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_by_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactsByUserStore on _ContactsByUserStoreBase, Store {
  final _$userIdAtom = Atom(name: '_ContactsByUserStoreBase.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$initialDateChoiceAtom =
      Atom(name: '_ContactsByUserStoreBase.initialDateChoice');

  @override
  String get initialDateChoice {
    _$initialDateChoiceAtom.reportRead();
    return super.initialDateChoice;
  }

  @override
  set initialDateChoice(String value) {
    _$initialDateChoiceAtom.reportWrite(value, super.initialDateChoice, () {
      super.initialDateChoice = value;
    });
  }

  final _$initialDateChoiceBRAtom =
      Atom(name: '_ContactsByUserStoreBase.initialDateChoiceBR');

  @override
  String get initialDateChoiceBR {
    _$initialDateChoiceBRAtom.reportRead();
    return super.initialDateChoiceBR;
  }

  @override
  set initialDateChoiceBR(String value) {
    _$initialDateChoiceBRAtom.reportWrite(value, super.initialDateChoiceBR, () {
      super.initialDateChoiceBR = value;
    });
  }

  final _$finalDateChoiceAtom =
      Atom(name: '_ContactsByUserStoreBase.finalDateChoice');

  @override
  String get finalDateChoice {
    _$finalDateChoiceAtom.reportRead();
    return super.finalDateChoice;
  }

  @override
  set finalDateChoice(String value) {
    _$finalDateChoiceAtom.reportWrite(value, super.finalDateChoice, () {
      super.finalDateChoice = value;
    });
  }

  final _$finalDateChoiceBRAtom =
      Atom(name: '_ContactsByUserStoreBase.finalDateChoiceBR');

  @override
  String get finalDateChoiceBR {
    _$finalDateChoiceBRAtom.reportRead();
    return super.finalDateChoiceBR;
  }

  @override
  set finalDateChoiceBR(String value) {
    _$finalDateChoiceBRAtom.reportWrite(value, super.finalDateChoiceBR, () {
      super.finalDateChoiceBR = value;
    });
  }

  final _$_ContactsByUserStoreBaseActionController =
      ActionController(name: '_ContactsByUserStoreBase');

  @override
  dynamic setUserId(String value) {
    final _$actionInfo = _$_ContactsByUserStoreBaseActionController.startAction(
        name: '_ContactsByUserStoreBase.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_ContactsByUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitialDateChoice(String value) {
    final _$actionInfo = _$_ContactsByUserStoreBaseActionController.startAction(
        name: '_ContactsByUserStoreBase.setInitialDateChoice');
    try {
      return super.setInitialDateChoice(value);
    } finally {
      _$_ContactsByUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitialDateChoiceBR(String value) {
    final _$actionInfo = _$_ContactsByUserStoreBaseActionController.startAction(
        name: '_ContactsByUserStoreBase.setInitialDateChoiceBR');
    try {
      return super.setInitialDateChoiceBR(value);
    } finally {
      _$_ContactsByUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinalDateChoice(String value) {
    final _$actionInfo = _$_ContactsByUserStoreBaseActionController.startAction(
        name: '_ContactsByUserStoreBase.setFinalDateChoice');
    try {
      return super.setFinalDateChoice(value);
    } finally {
      _$_ContactsByUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinalDateChoiceBR(String value) {
    final _$actionInfo = _$_ContactsByUserStoreBaseActionController.startAction(
        name: '_ContactsByUserStoreBase.setFinalDateChoiceBR');
    try {
      return super.setFinalDateChoiceBR(value);
    } finally {
      _$_ContactsByUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
initialDateChoice: ${initialDateChoice},
initialDateChoiceBR: ${initialDateChoiceBR},
finalDateChoice: ${finalDateChoice},
finalDateChoiceBR: ${finalDateChoiceBR}
    ''';
  }
}
