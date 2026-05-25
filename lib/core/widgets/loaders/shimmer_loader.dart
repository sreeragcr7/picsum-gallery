import 'package:flutter/material.dart';
import 'package:picsum_gallery/features/gallery/presentation/widgets/photo_card_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView.builder(
      itemCount: 5,

      itemBuilder: (_, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 15),

              child: Shimmer.fromColors(
                baseColor: colorScheme.surfaceContainer,

                highlightColor: colorScheme.surfaceContainerHighest,

                child: Container(
                  height: 20,
                  width: 120,

                  decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),

            SizedBox(
              height: 200,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: 5,

                itemBuilder: (_, _) {
                  return const PhotoCardShimmer();
                },
              ),
            ),

            const SizedBox(height: 25),
          ],
        );
      },
    );
  }
}
