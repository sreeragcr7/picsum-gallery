import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_gallery/core/common/entities/photo.dart';
import 'package:picsum_gallery/features/gallery/presentation/bloc/photo_bloc.dart';

class GallaryPage extends StatelessWidget {
  const GallaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Picsum Gallery'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              if (state is PhotoLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PhotoError) {
                return Center(child: Text(state.message));
              }

              if (state is PhotoLoaded) {
                final Map<String, List<PhotoEntity>> groupedPhotos = {};
                for (final photo in state.photos) {
                  if (groupedPhotos.containsKey(photo.author)) {
                    groupedPhotos[photo.author]!.add(photo);
                  } else {
                    groupedPhotos[photo.author] = [photo];
                  }
                }
                return ListView.builder(
                  itemCount: groupedPhotos.keys.length,
                  itemBuilder: (context, index) {
                    final author = groupedPhotos.keys.elementAt(index);
                    final photos = groupedPhotos[author]!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 20, left: 24),
                          child: Text(author, style: Theme.of(context).textTheme.titleSmall),
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: photos.length,
                            itemBuilder: (context, photoIndex) {
                              final photo = photos[photoIndex];

                              return Container(
                                width: 160,
                                margin: const EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [BoxShadow(color: Colors.black.withAlpha(26), blurRadius: 10)],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: CachedNetworkImage(
                                    imageUrl: photo.imageUrl,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
