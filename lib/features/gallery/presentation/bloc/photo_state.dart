part of 'photo_bloc.dart';

sealed class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

final class PhotoInitial extends PhotoState {}

final class PhotoLoading extends PhotoState {}

final class PhotoLoaded extends PhotoState {
  const PhotoLoaded({required this.allPhotos, required this.filteredPhotos});
  final List<PhotoEntity> allPhotos;
  final List<PhotoEntity> filteredPhotos;

  @override
  List<Object> get props => [allPhotos, filteredPhotos];
}

final class PhotoError extends PhotoState {
  const PhotoError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
