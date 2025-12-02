import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/page_model.dart';

class CarouselComponent extends StatelessWidget {
  final ComponentModel model;

  const CarouselComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final images = model.images ?? [];

    if (images.isEmpty) return const SizedBox();

    return Padding(
      padding: EdgeInsets.all(model.padding),
      child: CarouselSlider(
        options: CarouselOptions(
          height: model.height,
          autoPlay: model.autoPlay,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
        ),
        items: images.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}