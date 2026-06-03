import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_gallery/core/common/entities/photo.dart';
import 'package:picsum_gallery/core/widgets/loaders/shimmer_loader.dart';
import 'package:picsum_gallery/core/widgets/searchbar/app_search_bar.dart';
import 'package:picsum_gallery/features/gallery/presentation/bloc/photo_bloc.dart';
import 'package:picsum_gallery/features/gallery/presentation/widgets/author_section.dart';
import 'package:picsum_gallery/features/gallery/presentation/widgets/gallery_banner.dart';

class GallaryPage extends StatefulWidget {
  const GallaryPage({super.key});

  @override
  State<GallaryPage> createState() => _GallaryPageState();
}

class _GallaryPageState extends State<GallaryPage> {
  final ScrollController _scrollController = ScrollController();

  int currentPage = 1;

  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    context.read<PhotoBloc>().add(FetchPhotosEvent(currentPage));

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 300 && !isLoadingMore) {
        isLoadingMore = true;

        currentPage++;

        context.read<PhotoBloc>().add(FetchPhotosEvent(currentPage));

        await Future.delayed(const Duration(milliseconds: 500));

        isLoadingMore = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Picsum Gallery'), centerTitle: true),

        body: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),

              switchInCurve: Curves.easeIn,

              switchOutCurve: Curves.easeOut,

              child: () {
                if (state is PhotoLoading) {
                  return const ShimmerLoader(key: ValueKey('loading'));
                }

                if (state is PhotoError) {
                  return Center(key: const ValueKey('error'), child: Text(state.message));
                }

                if (state is PhotoLoaded) {
                  final Map<String, List<PhotoEntity>> groupedPhotos = {};

                  for (final photo in state.filteredPhotos) {
                    if (groupedPhotos.containsKey(photo.author)) {
                      groupedPhotos[photo.author]!.add(photo);
                    } else {
                      groupedPhotos[photo.author] = [photo];
                    }
                  }

                  final authors = groupedPhotos.keys.toList()
                    ..sort((a, b) => b.toLowerCase().compareTo(a.toLowerCase()));

                  final bool hasResults = state.filteredPhotos.isNotEmpty;

                  return Column(
                    key: const ValueKey('loaded'),
                    children: [
                      // Banner only when photos exist
                      if (hasResults)
                        GalleryBanner(
                          imageUrl: state.filteredPhotos[Random().nextInt(state.filteredPhotos.length)].imageUrl,
                        ),

                      // Search Bar
                      AppSearchBar(
                        onChanged: (value) {
                          context.read<PhotoBloc>().add(SearchPhotosEvent(value));
                        },
                      ),

                      Expanded(
                        child: !hasResults
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_off_rounded,
                                      size: 80,
                                      color: Theme.of(context).colorScheme.outline,
                                    ),

                                    const SizedBox(height: 16),

                                    Text('No author found', style: Theme.of(context).textTheme.titleMedium),

                                    const SizedBox(height: 8),

                                    Text('Try another search term', style: Theme.of(context).textTheme.bodyMedium),
                                  ],
                                ),
                              )
                            : RefreshIndicator(
                                onRefresh: () async {
                                  currentPage = 1;

                                  context.read<PhotoBloc>().add(RefreshPhotosEvent());
                                },
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: state.filteredPhotos.length == state.allPhotos.length
                                      ? authors.length + 1
                                      : authors.length,
                                  itemBuilder: (context, index) {
                                    if (state.filteredPhotos.length == state.allPhotos.length &&
                                        index == authors.length) {
                                      return const Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Center(child: CircularProgressIndicator()),
                                      );
                                    }

                                    final author = authors[index];

                                    return AuthorSection(author: author, photos: groupedPhotos[author]!);
                                  },
                                ),
                              ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              }(),
            );
          },
        ),
      ),
    );
  }
}
