import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:picsum_gallery/core/common/entities/photo.dart';

class PhotoDetails extends StatelessWidget {
  const PhotoDetails({super.key, required this.photo});

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(photo.author)),
      body: Center(
        child: Hero(
          tag: photo.id,
          child: CachedNetworkImage(imageUrl: photo.imageUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
