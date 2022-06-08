import 'package:dio/dio.dart';

import '../../data/models/create_users_model.dart';

class CreateUserRepo {
  const CreateUserRepo({required this.dio});
  final Dio dio;

  Future<CreateUserModel> createUser(String email,
  String phone,
  String fullName,
  String password,
  String username,
  DateTime birthday) async {
    final result = await dio.post('/api/users', data: {
  "email": email,
  "phone": phone,
  "fullName": fullName,
  "password": password,
  "username": username,
  "birthday": birthday,
  "roles": [
    "string"
  ]
});
    return CreateUserModel.fromJson(result.data);
  }
}
