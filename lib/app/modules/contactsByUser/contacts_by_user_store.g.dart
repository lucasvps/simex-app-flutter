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

  final _$dateChoiceAtom = Atom(name: '_ContactsByUserStoreBase.dateChoice');

  @override
  String get dateChoice {
    _$dateChoiceAtom.reportRead();
    return super.dateChoice;
  }

  @override
  set dateChoice(String value) {
    _$dateChoiceAtom.reportWrite(value, super.dateChoice, () {
      super.dateChoice = value;
    });
  }

  final _$dateChoiceBRAtom =
      Atom(name: '_ContactsByUserStoreBase.dateChoiceBR');

  @override
  String get dateChoiceBR {
    _$dateChoiceBRAtom.reportRead();
    return super.dateChoiceBR;
  }

  @override
  set dateChoiceBR(String value) {
    _$dateChoiceBRAtom.reportWrite(value, super.dateChoiceBR, () {
      super.dateChoiceBR = value;
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
  dynamic setDateChoice(String value) {
    final _$actionInfo = _$_ContactsByUserStoreBaseActionController.startAction(
        name: '_ContactsByUserStoreBase.setDateChoice');
    try {
      return super.setDateChoice(value);
    } finally {
      _$_ContactsByUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDateChoiceBR(String value) {
    final _$actionInfo = _$_ContactsByUserStoreBaseActionController.startAction(
        name: '_ContactsByUserStoreBase.setDateChoiceBR');
    try {
      return super.setDateChoiceBR(value);
    } finally {
      _$_ContactsByUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
dateChoice: ${dateChoice},
dateChoiceBR: ${dateChoiceBR}
    ''';
  }
}
