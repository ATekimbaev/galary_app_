import 'package:dio/dio.dart';
import 'package:gallary_app/%20feauture/data/models/login_user_model.dart';

class LoginRepo {
  const LoginRepo({required this.dio});
  final Dio dio;

  Future logIn({required String name, }) async {
    final result = await dio.post('api/clients', data: {
      "name": name,
      "allowedGrantTypes": ["password", "refresh_token"]
    });

    final jsonList = result.data;
    final LogInModel clientSecret = LogInModel.fromJson(jsonList);
  return clientSecret;

  }

      Future getToken({required String name, required String password,required String secret, required int id,required String randomId, }) async {
      final result = await dio.get(
          '/oauth/v2/token',
          queryParameters: {
            "clientId": "${id}_$randomId",
            "grantType": "password",
            "username": name,
            'password': password,
            "clientSecret": secret,
          });

      final jsonList = result.data;
      final LogInModel tokens = LogInModel.fromJson(jsonList);
      return tokens;
    }
}
