// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersController on _UsersControllerBase, Store {
  final _$usersAtom = Atom(name: '_UsersControllerBase.users');

  @override
  ObservableFuture<List<UserModel>> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableFuture<List<UserModel>> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  @override
  String toString() {
    return '''
users: ${users}
    ''';
  }
}
