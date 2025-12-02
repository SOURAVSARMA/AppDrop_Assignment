import 'package:flutter_test/flutter_test.dart';
import 'package:appdrop_assignment/core/widget_factory.dart';
import 'package:appdrop_assignment/models/page_model.dart';
import 'package:appdrop_assignment/widgets/banner_component.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('WidgetFactory creates BannerComponent for banner type', (WidgetTester tester) async {
    final model = ComponentModel(
        type: 'banner',
        image: 'https://example.com/img.png',
        height: 100
    );

    final widget = WidgetFactory.buildComponent(model);

    expect(widget.runtimeType, BannerComponent);
  });

  testWidgets('WidgetFactory returns Error Widget for unknown type', (WidgetTester tester) async {
    final model = ComponentModel(type: 'unknown_alien_widget');

    final widget = WidgetFactory.buildComponent(model);

    expect(widget.runtimeType, SizedBox);
  });
}