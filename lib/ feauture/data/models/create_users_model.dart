class CreateUserModel {
  String? email;
  String? phone;
  String? fullName;
  String? password;
  String? username;
  String? birthday;
  List<String>? roles;

  CreateUserModel(
      {this.email,
      this.phone,
      this.fullName,
      this.password,
      this.username,
      this.birthday,
      this.roles});

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    fullName = json['fullName'];
    password = json['password'];
    username = json['username'];
    birthday = json['birthday'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['email'] = email;
    data['phone'] = phone;
    data['fullName'] = fullName;
    data['password'] = password;
    data['username'] = username;
    data['birthday'] = birthday;
    data['roles'] = roles;
    return data;
  }
}
