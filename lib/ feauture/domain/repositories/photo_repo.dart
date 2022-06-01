import 'package:dio/dio.dart';
import 'package:gallary_app/%20feauture/data/models/photo_models/photo_data.dart';
import 'package:gallary_app/%20feauture/data/models/photo_models/photo_models.dart';

class PhotoRepo {
  final Dio dio;
  PhotoRepo({
    required this.dio,
  });

  Future<List<PhotoModel>> getPhot() async {
    final result = await dio.get('api/photos');

    final jsonList = result.data;
    final List<PhotoModel> photos = DataModel.fromJson(jsonList).data ?? [];

    return photos;
  }
}
