import 'package:picsum_gallery/core/common/entities/photo.dart';

final class PhotoModel extends PhotoEntity {
  const PhotoModel({required super.id, required super.author, required super.imageUrl});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(id: json['id'], author: json['author'], imageUrl: json['download_url']);
  }
}
