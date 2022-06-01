part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoSuccses extends PhotoState {
  final List<PhotoModel> photos;

  PhotoSuccses({
    required this.photos,
  });
}

class PhotoError extends PhotoState {}
