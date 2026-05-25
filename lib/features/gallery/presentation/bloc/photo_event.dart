part of 'photo_bloc.dart';

sealed class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

final class FetchPhotosEvent extends PhotoEvent {
  const FetchPhotosEvent(this.page);
  final int page;

  @override
  List<Object> get props => [page];
}

final class SearchPhotosEvent extends PhotoEvent {
  const SearchPhotosEvent(this.query);
  final String query;

  @override
  List<Object> get props => [query];
}

final class RefreshPhotosEvent  extends PhotoEvent {
  
}
