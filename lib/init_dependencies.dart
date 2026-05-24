//Service locator
import 'package:get_it/get_it.dart';
import 'package:picsum_gallery/features/gallery/data/datasources/photo_remote_data_source.dart';
import 'package:picsum_gallery/features/gallery/data/repositories/photo_repository_impl.dart';
import 'package:picsum_gallery/features/gallery/domain/repository/photo_repository.dart';
import 'package:picsum_gallery/features/gallery/presentation/bloc/photo_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencied() async {
  sl.registerLazySingleton<PhotoRemoteDataSource>(() => PhotoRemoteDataSourceImpl());
  sl.registerLazySingleton<PhotoRepository>(() => PhotoRepositoryImpl(sl()));
  sl.registerFactory(() => PhotoBloc(sl()));
}
