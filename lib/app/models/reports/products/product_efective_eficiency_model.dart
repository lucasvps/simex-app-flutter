class ProductsEfectiveEfficiencyModel {
  String productName;
  String initialDate;
  String finalDate;
  String price;
  int sales;
  String valueSold;

  ProductsEfectiveEfficiencyModel(
      {this.productName,
      this.initialDate,
      this.finalDate,
      this.price,
      this.sales,
      this.valueSold});

  ProductsEfectiveEfficiencyModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    initialDate = json['initial_date'];
    finalDate = json['final_date'];
    price = json['price'];
    sales = json['sales'];
    valueSold = json['valueSold'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['initial_date'] = this.initialDate;
    data['final_date'] = this.finalDate;
    data['price'] = this.price;
    data['sales'] = this.sales;
    data['valueSold'] = this.valueSold.toString();
    return data;
  }
}