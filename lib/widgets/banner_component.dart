import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/page_model.dart';

class BannerComponent extends StatelessWidget {
  final ComponentModel model;

  const BannerComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(model.padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(model.radius),
        child: CachedNetworkImage(
          imageUrl: model.image ?? '',
          height: model.height > 0 ? model.height : null,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            height: model.height,
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => Container(
            height: model.height,
            color: Colors.grey[300],
            child: const Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }
}