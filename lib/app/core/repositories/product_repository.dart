//import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simex_app/app/core/custom_dio.dart';
import 'package:simex_app/app/core/endpoints.dart';
import 'package:simex_app/app/models/product_model.dart';

class ProductRepository {

  Future newProduct(ProductModel model) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.PRODUCTS_URL;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.post(url, data: model.toJson()).then((value){
      Modular.to.pushReplacementNamed('/home');
    }).catchError((err){
      return err;
    });
  }




  Future<List<ProductModel>> getProducts() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.PRODUCTS_URL;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ProductModel> products = [];

      for (var item in value.data) {
        ProductModel productModel = ProductModel.fromJson(item);
        products.add(productModel);
      }

      return products;
    });
  }

  Future<List<ProductModel>> currentProducts() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.PRODUCTS_URL;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<ProductModel> products = [];


      for (var item in value.data) {
        ProductModel productModel = ProductModel.fromJson(item);
        
        products.add(productModel);
      }

      return products;
    });
  }

  Future getProductName(String id) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.PRODUCTS_URL + '/$id';
    //print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      return value.toString();
    }).catchError((err){
      return err;
    });
  }

  Future getProductPrice(String id) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.PRODUCT_PRICE + '/$id';
    //print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      return value.toString();
    }).catchError((err){
      print('repo erro ' + err.toString());
      return err;
    });
  }
}
