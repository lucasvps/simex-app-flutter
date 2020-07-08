class ProductsePendingEfficiencyModel {
  String productName;
  String initialDate;
  String finalDate;
  String price;
  int contacts;

  ProductsePendingEfficiencyModel(
      {this.productName,
      this.initialDate,
      this.finalDate,
      this.price,
      this.contacts});

  ProductsePendingEfficiencyModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    initialDate = json['initial_date'];
    finalDate = json['final_date'];
    price = json['price'];
    contacts = json['contacts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['initial_date'] = this.initialDate;
    data['final_date'] = this.finalDate;
    data['price'] = this.price;
    data['contacts'] = this.contacts;
    return data;
  }
}