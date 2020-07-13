// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewUserStore on _NewUserStoreBase, Store {
  Computed<bool> _$isButtonValidComputed;

  @override
  bool get isButtonValid =>
      (_$isButtonValidComputed ??= Computed<bool>(() => super.isButtonValid,
              name: '_NewUserStoreBase.isButtonValid'))
          .value;

  final _$nameAtom = Atom(name: '_NewUserStoreBase.name');

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

  final _$emailAtom = Atom(name: '_NewUserStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_NewUserStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isAdminAtom = Atom(name: '_NewUserStoreBase.isAdmin');

  @override
  bool get isAdmin {
    _$isAdminAtom.reportRead();
    return super.isAdmin;
  }

  @override
  set isAdmin(bool value) {
    _$isAdminAtom.reportWrite(value, super.isAdmin, () {
      super.isAdmin = value;
    });
  }

  final _$isPasswordVisibleAtom =
      Atom(name: '_NewUserStoreBase.isPasswordVisible');

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  final _$_NewUserStoreBaseActionController =
      ActionController(name: '_NewUserStoreBase');

  @override
  dynamic setUserName(String value) {
    final _$actionInfo = _$_NewUserStoreBaseActionController.startAction(
        name: '_NewUserStoreBase.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_NewUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserEmail(String value) {
    final _$actionInfo = _$_NewUserStoreBaseActionController.startAction(
        name: '_NewUserStoreBase.setUserEmail');
    try {
      return super.setUserEmail(value);
    } finally {
      _$_NewUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserPassword(String value) {
    final _$actionInfo = _$_NewUserStoreBaseActionController.startAction(
        name: '_NewUserStoreBase.setUserPassword');
    try {
      return super.setUserPassword(value);
    } finally {
      _$_NewUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsAdmin() {
    final _$actionInfo = _$_NewUserStoreBaseActionController.startAction(
        name: '_NewUserStoreBase.setIsAdmin');
    try {
      return super.setIsAdmin();
    } finally {
      _$_NewUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeVisibility() {
    final _$actionInfo = _$_NewUserStoreBaseActionController.startAction(
        name: '_NewUserStoreBase.changeVisibility');
    try {
      return super.changeVisibility();
    } finally {
      _$_NewUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
isAdmin: ${isAdmin},
isPasswordVisible: ${isPasswordVisible},
isButtonValid: ${isButtonValid}
    ''';
  }
}
