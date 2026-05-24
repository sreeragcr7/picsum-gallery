import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_gallery/core/common/entities/photo.dart';
import 'package:picsum_gallery/core/widgets/loaders/shimmer_loader.dart';
import 'package:picsum_gallery/features/gallery/presentation/bloc/photo_bloc.dart';
import 'package:picsum_gallery/features/gallery/presentation/widgets/author_section.dart';

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
                return const Center(child: ShimmerLoader());
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
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<PhotoBloc>().add(FetchPhotosEvent());
                  },
                  child: ListView.builder(
                    itemCount: groupedPhotos.keys.length,
                    itemBuilder: (context, index) {
                      final author = groupedPhotos.keys.elementAt(index);
                      return AuthorSection(author: author, photos: groupedPhotos[author]!);
                    },
                  ),
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
