import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/page_model.dart';

class GridComponent extends StatelessWidget {
  final ComponentModel model;

  const GridComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final images = model.images ?? [];

    if (images.isEmpty) return const SizedBox();

    return Padding(
      padding: EdgeInsets.all(model.padding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: model.columns,
          crossAxisSpacing: model.spacing,
          mainAxisSpacing: model.spacing,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: images[index],
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
              ),
            ),
          );
        },
      ),
    );
  }
}