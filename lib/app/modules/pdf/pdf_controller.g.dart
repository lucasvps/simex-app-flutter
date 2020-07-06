// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PdfController on _PdfControllerBase, Store {
  final _$clientsWithoutContactAtom =
      Atom(name: '_PdfControllerBase.clientsWithoutContact');

  @override
  ObservableFuture<List<ClientsWithoutContact>> get clientsWithoutContact {
    _$clientsWithoutContactAtom.reportRead();
    return super.clientsWithoutContact;
  }

  @override
  set clientsWithoutContact(
      ObservableFuture<List<ClientsWithoutContact>> value) {
    _$clientsWithoutContactAtom.reportWrite(value, super.clientsWithoutContact,
        () {
      super.clientsWithoutContact = value;
    });
  }

  @override
  String toString() {
    return '''
clientsWithoutContact: ${clientsWithoutContact}
    ''';
  }
}
