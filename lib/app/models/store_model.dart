class StoreModel {
  int id;
  String storeName;

  StoreModel({this.id, this.storeName});

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeName = json['store_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_name'] = this.storeName;
    return data;
  }
}
