import 'package:equatable/equatable.dart';
import 'package:picsum_gallery/core/common/entities/photo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_gallery/features/gallery/domain/repository/photo_repository.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;
  PhotoBloc(this.photoRepository) : super(PhotoInitial()) {
    on<FetchPhotosEvent>(_onFetchPhotos);
  }

  Future<void> _onFetchPhotos(FetchPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoLoading());
    try {
      final photos = await photoRepository.getPhotos();
      emit(PhotoLoaded(photos));
    } catch (e) {
      emit(PhotoError(e.toString()));
    }
  }
}
