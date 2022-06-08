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
class TokenModel {
  String? accessToken;
  int? expiresIn;
  String? tokenType;
  Null? scope;
  String? refreshToken;

  TokenModel(
      {this.accessToken,
      this.expiresIn,
      this.tokenType,
      this.scope,
      this.refreshToken});

  TokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
    scope = json['scope'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    data['scope'] = this.scope;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
