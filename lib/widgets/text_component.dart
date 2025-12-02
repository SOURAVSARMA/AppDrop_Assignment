import 'package:flutter/material.dart';
import '../models/page_model.dart';

class TextComponent extends StatelessWidget {
  final ComponentModel model;

  const TextComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(model.padding),
      child: Text(
        model.value ?? '',
        textAlign: _getAlign(model.textAlign),
        style: TextStyle(
          fontSize: model.fontSize,
          fontWeight: _getWeight(model.fontWeight),
        ),
      ),
    );
  }

  TextAlign _getAlign(String align) {
    switch (align.toLowerCase()) {
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      default:
        return TextAlign.left;
    }
  }

  FontWeight _getWeight(String weight) {
    return weight.toLowerCase() == 'bold' ? FontWeight.bold : FontWeight.normal;
  }
}