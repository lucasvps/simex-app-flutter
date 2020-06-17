// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientStore on _ClientStoreBase, Store {
  final _$searchDocAtom = Atom(name: '_ClientStoreBase.searchDoc');

  @override
  String get searchDoc {
    _$searchDocAtom.reportRead();
    return super.searchDoc;
  }

  @override
  set searchDoc(String value) {
    _$searchDocAtom.reportWrite(value, super.searchDoc, () {
      super.searchDoc = value;
    });
  }

  final _$_ClientStoreBaseActionController =
      ActionController(name: '_ClientStoreBase');

  @override
  dynamic setSearch(String value) {
    final _$actionInfo = _$_ClientStoreBaseActionController.startAction(
        name: '_ClientStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_ClientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchDoc: ${searchDoc}
    ''';
  }
}
