import 'dart:ffi';

class ProductModel {
  int id;
  String productName;
  String price;
  String initialDate;
  String finalDate;

  ProductModel(
      {this.id,
      this.productName,
      this.price,
      this.initialDate,
      this.finalDate});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    price = json['price'];
    initialDate = json['initial_date'];
    finalDate = json['final_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['initial_date'] = this.initialDate;
    data['final_date'] = this.finalDate;
    return data;
  }
}