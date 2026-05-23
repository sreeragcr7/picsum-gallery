import 'package:picsum_gallery/core/common/entities/photo.dart';
import 'package:picsum_gallery/features/gallery/data/datasources/photo_remote_data_source.dart';
import 'package:picsum_gallery/features/gallery/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  const PhotoRepositoryImpl(this.photoRemoteDataSource);
  final PhotoRemoteDataSource photoRemoteDataSource;
  @override
  Future<List<PhotoEntity>> getPhotos() async{
    return await photoRemoteDataSource.fetchPhotos();
  }
}
