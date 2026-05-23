import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:picsum_gallery/features/gallery/data/models/photo_model.dart';

abstract interface class PhotoRemoteDataSource {
  Future<List<PhotoModel>> fetchPhotos();
}

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  @override
  Future<List<PhotoModel>> fetchPhotos() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));

    if (response.statusCode == HttpStatus.ok) {
      final List data = jsonDecode(response.body);
      return List.from(data).map((e) => PhotoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Photos');
    }
  }
}
