class UserModel {
  int id;
  String name;
  String email;
  String password;
  int isAdmin;

  UserModel({this.id, this.name, this.email, this.password, this.isAdmin});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['is_admin'] = this.isAdmin;
    return data;
  }

  Map<String, dynamic> toJsonLogin() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}