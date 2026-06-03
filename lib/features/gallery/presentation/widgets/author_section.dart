import 'package:flutter/material.dart';
import 'package:picsum_gallery/core/common/entities/photo.dart';
import 'package:picsum_gallery/features/gallery/presentation/widgets/photo_card.dart';

class AuthorSection extends StatelessWidget {
  const AuthorSection({super.key, required this.author, required this.photos});

  final String author;
  final List<PhotoEntity> photos;

  @override
  Widget build(BuildContext context) {
    // final reversedPhotos = photos.reversed.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 24),
          child: Text(author, style: Theme.of(context).textTheme.titleSmall),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // reversedPhotos.length,
              itemCount: photos.length,
              itemBuilder: (context, index) {
                // reversedPhotos[index]
                return PhotoCard(photo: photos[index]);
              },
            ),
          ),
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}
