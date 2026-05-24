import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_gallery/core/theme/app_theme.dart';
import 'package:picsum_gallery/features/gallery/data/datasources/photo_remote_data_source.dart';
import 'package:picsum_gallery/features/gallery/data/repositories/photo_repository_impl.dart';
import 'package:picsum_gallery/features/gallery/domain/repository/photo_repository.dart';
import 'package:picsum_gallery/features/gallery/presentation/bloc/photo_bloc.dart';
import 'package:picsum_gallery/features/gallery/presentation/pages/gallary_page.dart';
import 'package:picsum_gallery/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencied();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PhotoBloc>()..add(FetchPhotosEvent()),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const GallaryPage(),
      ),
    );
  }
}
