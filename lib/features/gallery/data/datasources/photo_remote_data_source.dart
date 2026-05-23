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
    try {
      final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> data = jsonDecode(response.body);
        return List.from(data).map((photo) => PhotoModel.fromJson(photo)).toList();
      } else {
        throw Exception('Failed to load Photos');
      }
    } catch (_) {
      throw Exception('Unexpected error occurred');
    }
  }
}

// class PhotoRemoteDataSource {
//   Future<void> fetchPhoto() async {
//     try {
//       final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));

//       print('Status code: ${response.statusCode}');

//       if (response.statusCode == HttpStatus.ok) {
//         final data = jsonDecode(response.body);
//         print(data);
//       } else {
//         print('Failed to fetch photos');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
