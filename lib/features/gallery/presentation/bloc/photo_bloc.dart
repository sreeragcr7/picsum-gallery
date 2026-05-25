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
    on<SearchPhotosEvent>(_onSearchPhotos);
    on<RefreshPhotosEvent>(_onRefreshPhotos);
  }

  Future<void> _onFetchPhotos(FetchPhotosEvent event, Emitter<PhotoState> emit) async {
    final currentState = state;
    try {
      List<PhotoEntity> oldPhotos = [];

      if (currentState is PhotoLoaded) {
        oldPhotos = currentState.allPhotos;
      } else {
        emit(PhotoLoading());
      }

      final newPhotos = await photoRepository.getPhotos(event.page);
      final allPhotos = [...oldPhotos, ...newPhotos];
      emit(PhotoLoaded(allPhotos: allPhotos, filteredPhotos: allPhotos));
    } catch (e) {
      emit(PhotoError(e.toString()));
    }
  }

  void _onSearchPhotos(SearchPhotosEvent event, Emitter<PhotoState> emit) {
    final currentState = state;
    if (currentState is PhotoLoaded) {
      final filtered = currentState.allPhotos.where((photos) {
        return photos.author.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      emit(PhotoLoaded(allPhotos: currentState.allPhotos, filteredPhotos: filtered));
    }
  }

  Future<void> _onRefreshPhotos(RefreshPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoLoading());

    try {
      final photos = await photoRepository.getPhotos(1);
      emit(PhotoLoaded(allPhotos: photos, filteredPhotos: photos));
    } catch (e) {
      emit(PhotoError(e.toString()));
    }
  }
}
