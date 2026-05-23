import 'package:picsum_gallery/core/common/entities/photo.dart';

final class PhotoModel extends PhotoEntity {
  const PhotoModel({
    required super.id,
    required super.author,
    required super.imageUrl,
    required super.height,
    required super.width,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      author: json['author'],
      height: json['height'],
      width: json['width'],
      imageUrl: json['download_url'],
    );
  }
}
