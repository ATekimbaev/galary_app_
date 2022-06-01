import 'package:bloc/bloc.dart';
import 'package:gallary_app/%20feauture/data/models/photo_models/photo_data.dart';
import 'package:gallary_app/%20feauture/domain/repositories/photo_repo.dart';
import 'package:meta/meta.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc({required this.repo}) : super(PhotoInitial()) {
    on<PhotoLoadEvent>((event, emit) async {
      emit(PhotoLoading());

      try {
        final result = await repo.getPhot();
        Future.delayed(const Duration(seconds: 2));
        emit(PhotoSuccses(photos: result));
      } catch (e) {
        emit(PhotoError());
      }
    });
  }
  final PhotoRepo repo;
}
