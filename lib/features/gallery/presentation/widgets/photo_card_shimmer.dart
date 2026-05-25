import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PhotoCardShimmer extends StatelessWidget {
  const PhotoCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Shimmer.fromColors(
        baseColor: colorScheme.surfaceContainer,

        highlightColor: colorScheme.surfaceContainerHighest,
        child: Container(
          width: 160,
          decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(13)),
        ),
      ),
    );
  }
}
