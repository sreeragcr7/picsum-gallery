part of 'photo_bloc.dart';

sealed class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

final class PhotoInitial extends PhotoState {}

final class PhotoLoading extends PhotoState {}

final class PhotoLoaded extends PhotoState {
  const PhotoLoaded(this.photos);
  final List<PhotoEntity> photos;

  @override
  List<Object> get props => [photos];
}

final class PhotoError extends PhotoState {
  const PhotoError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
