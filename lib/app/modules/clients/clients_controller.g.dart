// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientsController on _ClientsControllerBase, Store {
  final _$searchDocAtom = Atom(name: '_ClientsControllerBase.searchDoc');

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

  final _$_ClientsControllerBaseActionController =
      ActionController(name: '_ClientsControllerBase');

  @override
  dynamic setSearch(String value) {
    final _$actionInfo = _$_ClientsControllerBaseActionController.startAction(
        name: '_ClientsControllerBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_ClientsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchDoc: ${searchDoc}
    ''';
  }
}
