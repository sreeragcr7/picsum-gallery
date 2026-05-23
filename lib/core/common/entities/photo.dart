import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable {
  const PhotoEntity({
    required this.id,
    required this.author,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  final String id;
  final String author;
  final int height;
  final int width;
  final String imageUrl;

  @override
  List<Object> get props => [id, author, height, width, imageUrl];
}
