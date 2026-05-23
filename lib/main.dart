import 'package:flutter/material.dart';
import 'package:picsum_gallery/features/gallery/data/datasources/photo_remote_data_source.dart';
import 'package:picsum_gallery/features/gallery/data/repositories/photo_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = PhotoRepositoryImpl(PhotoRemoteDataSourceImpl());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: repository.getPhotos(),
          builder: (context, snapsot) {
            if (!snapsot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final photo = snapsot.data!;

            return Center(child: Text(photo[0].author));
          },
        ),
      ),
    );
  }
}
