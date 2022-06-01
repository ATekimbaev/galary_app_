import 'package:dio/dio.dart';

import '../../data/models/create_users_model.dart';

class CreateUserRepo {
  const CreateUserRepo({required this.dio});
  final Dio dio;

  Future<CreateUserModel> createUser() async {
    final result = await dio.post('/api/users');
    return CreateUserModel.fromJson(result.data);
  }
}
