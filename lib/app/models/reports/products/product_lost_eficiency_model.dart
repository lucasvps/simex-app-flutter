class ProductsLostEfficiencyModel {
  String productName;
  String initialDate;
  String finalDate;
  String price;
  int losts;

  ProductsLostEfficiencyModel(
      {this.productName,
      this.initialDate,
      this.finalDate,
      this.price,
      this.losts});

  ProductsLostEfficiencyModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    initialDate = json['initial_date'];
    finalDate = json['final_date'];
    price = json['price'];
    losts = json['losts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['initial_date'] = this.initialDate;
    data['final_date'] = this.finalDate;
    data['price'] = this.price;
    data['losts'] = this.losts;
    return data;
  }
}