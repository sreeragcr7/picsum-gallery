import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_gallery/core/common/entities/photo.dart';
import 'package:picsum_gallery/core/widgets/loaders/shimmer_loader.dart';
import 'package:picsum_gallery/core/widgets/searchbar/app_search_bar.dart';
import 'package:picsum_gallery/features/gallery/presentation/bloc/photo_bloc.dart';
import 'package:picsum_gallery/features/gallery/presentation/widgets/author_section.dart';

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

                  return Column(
                    key: const ValueKey('loaded'),

                    children: [
                      AppSearchBar(
                        onChanged: (value) {
                          context.read<PhotoBloc>().add(SearchPhotosEvent(value));
                        },
                      ),

                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            currentPage = 1;

                            context.read<PhotoBloc>().add(RefreshPhotosEvent());
                          },

                          child: ListView.builder(
                            controller: _scrollController,

                            itemCount: state.filteredPhotos.length == state.allPhotos.length
                                ? groupedPhotos.keys.length + 1
                                : groupedPhotos.keys.length,

                            itemBuilder: (context, index) {
                              if (state.filteredPhotos.length == state.allPhotos.length &&
                                  index == groupedPhotos.keys.length) {
                                return const Padding(
                                  padding: EdgeInsets.all(16),

                                  child: Center(child: CircularProgressIndicator()),
                                );
                              }

                              final author = groupedPhotos.keys.elementAt(index);

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
