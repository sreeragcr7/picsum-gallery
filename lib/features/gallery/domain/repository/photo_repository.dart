import 'package:picsum_gallery/core/common/entities/photo.dart';

abstract interface class PhotoRepository {
  Future<List<PhotoEntity>> getPhotos(int page);
}
