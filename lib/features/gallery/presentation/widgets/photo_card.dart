import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:picsum_gallery/core/common/entities/photo.dart';
import 'package:picsum_gallery/features/gallery/presentation/widgets/photo_details.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key, required this.photo});

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => PhotoDetails(photo: photo)));
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          boxShadow: [BoxShadow(color: Colors.white.withAlpha(26), blurRadius: 10)],
        ),
        child: Hero(
          tag: photo.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: CachedNetworkImage(
              imageUrl: photo.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
