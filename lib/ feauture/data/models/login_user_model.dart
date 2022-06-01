class LogInModel {
  int? id;
  String? name;
  String? randomId;
  String? secret;


  LogInModel(
      {this.id, this.name, this.randomId, this.secret,});

  LogInModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    randomId = json['randomId'];
    secret = json['secret'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['randomId'] = this.randomId;
    data['secret'] = this.secret;
    return data;
  }
}