import 'package:flutter/material.dart';
import '../models/page_model.dart';
import '../widgets/banner_component.dart';
import '../widgets/carousel_component.dart';
import '../widgets/grid_component.dart';
import '../widgets/text_component.dart';
import '../widgets/video_component.dart';

class WidgetFactory {
  static Widget buildComponent(ComponentModel model) {
    try {
      switch (model.type) {
        case 'banner':
          return BannerComponent(model: model);
        case 'carousel':
          return CarouselComponent(model: model);
        case 'grid':
          return GridComponent(model: model);
        case 'video':
          return VideoComponent(model: model);
        case 'text':
          return TextComponent(model: model);
        default:
          return SizedBox(
            height: 50,
            child: Center(child: Text('Unknown component type: ${model.type}')),
          );
      }
    } catch (e) {
      return SizedBox(
        height: 50,
        child: Center(child: Text('Error rendering component: $e')),
      );
    }
  }
}