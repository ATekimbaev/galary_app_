import 'package:gallary_app/%20feauture/data/models/photo_models/photo_image.dart';


class PhotoModel {
  int? id;
  String? name;
  String? dateCreate;
  String? description;
  bool? newImage;
  bool? popular;
  ImageModel? image;
  String? user;

  PhotoModel(
      {this.id,
      this.name,
      this.dateCreate,
      this.description,
      this.newImage,
      this.popular,
      this.image,
      this.user});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateCreate = json['dateCreate'];
    description = json['description'];
    newImage = json['new'];
    popular = json['popular'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['dateCreate'] = dateCreate;
    data['description'] = description;
    data['new'] = newImage;
    data['popular'] = popular;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['user'] = user;
    return data;
  }
}