// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_contact_to_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SetContactToUserController on _SetContactToUserControllerBase, Store {
  final _$listOfClientsAtom =
      Atom(name: '_SetContactToUserControllerBase.listOfClients');

  @override
  ObservableFuture<List<ClientModel>> get listOfClients {
    _$listOfClientsAtom.reportRead();
    return super.listOfClients;
  }

  @override
  set listOfClients(ObservableFuture<List<ClientModel>> value) {
    _$listOfClientsAtom.reportWrite(value, super.listOfClients, () {
      super.listOfClients = value;
    });
  }

  @override
  String toString() {
    return '''
listOfClients: ${listOfClients}
    ''';
  }
}
