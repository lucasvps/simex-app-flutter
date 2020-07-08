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

  final _$clientsWithoutPurchaseAtom =
      Atom(name: '_PdfControllerBase.clientsWithoutPurchase');

  @override
  ObservableFuture<List<ClientsWithoutPurchase>> get clientsWithoutPurchase {
    _$clientsWithoutPurchaseAtom.reportRead();
    return super.clientsWithoutPurchase;
  }

  @override
  set clientsWithoutPurchase(
      ObservableFuture<List<ClientsWithoutPurchase>> value) {
    _$clientsWithoutPurchaseAtom
        .reportWrite(value, super.clientsWithoutPurchase, () {
      super.clientsWithoutPurchase = value;
    });
  }

  final _$clientsSpentMoreAtom =
      Atom(name: '_PdfControllerBase.clientsSpentMore');

  @override
  ObservableFuture<List<ClientsSpentMore>> get clientsSpentMore {
    _$clientsSpentMoreAtom.reportRead();
    return super.clientsSpentMore;
  }

  @override
  set clientsSpentMore(ObservableFuture<List<ClientsSpentMore>> value) {
    _$clientsSpentMoreAtom.reportWrite(value, super.clientsSpentMore, () {
      super.clientsSpentMore = value;
    });
  }

  final _$productsEfectiveEficiencyAtom =
      Atom(name: '_PdfControllerBase.productsEfectiveEficiency');

  @override
  ObservableFuture<List<ProductsEfectiveEfficiencyModel>>
      get productsEfectiveEficiency {
    _$productsEfectiveEficiencyAtom.reportRead();
    return super.productsEfectiveEficiency;
  }

  @override
  set productsEfectiveEficiency(
      ObservableFuture<List<ProductsEfectiveEfficiencyModel>> value) {
    _$productsEfectiveEficiencyAtom
        .reportWrite(value, super.productsEfectiveEficiency, () {
      super.productsEfectiveEficiency = value;
    });
  }

  final _$productsPendingEficiencyAtom =
      Atom(name: '_PdfControllerBase.productsPendingEficiency');

  @override
  ObservableFuture<List<ProductsePendingEfficiencyModel>>
      get productsPendingEficiency {
    _$productsPendingEficiencyAtom.reportRead();
    return super.productsPendingEficiency;
  }

  @override
  set productsPendingEficiency(
      ObservableFuture<List<ProductsePendingEfficiencyModel>> value) {
    _$productsPendingEficiencyAtom
        .reportWrite(value, super.productsPendingEficiency, () {
      super.productsPendingEficiency = value;
    });
  }

  final _$productsLostEficiencyAtom =
      Atom(name: '_PdfControllerBase.productsLostEficiency');

  @override
  ObservableFuture<List<ProductsLostEfficiencyModel>>
      get productsLostEficiency {
    _$productsLostEficiencyAtom.reportRead();
    return super.productsLostEficiency;
  }

  @override
  set productsLostEficiency(
      ObservableFuture<List<ProductsLostEfficiencyModel>> value) {
    _$productsLostEficiencyAtom.reportWrite(value, super.productsLostEficiency,
        () {
      super.productsLostEficiency = value;
    });
  }

  final _$enterpriseReportModelAtom =
      Atom(name: '_PdfControllerBase.enterpriseReportModel');

  @override
  ObservableFuture<EnterpriseReportModel> get enterpriseReportModel {
    _$enterpriseReportModelAtom.reportRead();
    return super.enterpriseReportModel;
  }

  @override
  set enterpriseReportModel(ObservableFuture<EnterpriseReportModel> value) {
    _$enterpriseReportModelAtom.reportWrite(value, super.enterpriseReportModel,
        () {
      super.enterpriseReportModel = value;
    });
  }

  final _$userReportModelAtom =
      Atom(name: '_PdfControllerBase.userReportModel');

  @override
  ObservableFuture<UserReportModel> get userReportModel {
    _$userReportModelAtom.reportRead();
    return super.userReportModel;
  }

  @override
  set userReportModel(ObservableFuture<UserReportModel> value) {
    _$userReportModelAtom.reportWrite(value, super.userReportModel, () {
      super.userReportModel = value;
    });
  }

  @override
  String toString() {
    return '''
clientsWithoutContact: ${clientsWithoutContact},
clientsWithoutPurchase: ${clientsWithoutPurchase},
clientsSpentMore: ${clientsSpentMore},
productsEfectiveEficiency: ${productsEfectiveEficiency},
productsPendingEficiency: ${productsPendingEficiency},
productsLostEficiency: ${productsLostEficiency},
enterpriseReportModel: ${enterpriseReportModel},
userReportModel: ${userReportModel}
    ''';
  }
}
