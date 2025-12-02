class PageModel {
  final List<ComponentModel> components;

  PageModel({required this.components});

  factory PageModel.fromJson(Map<String, dynamic> json) {
    var list = json['page']['components'] as List;
    List<ComponentModel> componentsList =
    list.map((i) => ComponentModel.fromJson(i)).toList();
    return PageModel(components: componentsList);
  }
}

class ComponentModel {
  final String type;
  final String? image;
  final List<String>? images;
  final String? url;
  final String? value;
  final double height;
  final double padding;
  final double radius;
  final double spacing;
  final int columns;
  final double fontSize;
  final String fontWeight;
  final String textAlign;
  final bool autoPlay;
  final bool loop;

  ComponentModel({
    required this.type,
    this.image,
    this.images,
    this.url,
    this.value,
    this.height = 0,
    this.padding = 0,
    this.radius = 0,
    this.spacing = 0,
    this.columns = 1,
    this.fontSize = 14,
    this.fontWeight = 'normal',
    this.textAlign = 'left',
    this.autoPlay = false,
    this.loop = false,
  });

  factory ComponentModel.fromJson(Map<String, dynamic> json) {
    return ComponentModel(
      type: json['type'] ?? 'unknown',

      image: json['image'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      url: json['url'],
      value: json['value'],

      height: (json['height'] ?? 0).toDouble(),
      padding: (json['padding'] ?? 0).toDouble(),
      radius: (json['radius'] ?? 0).toDouble(),
      spacing: (json['spacing'] ?? 0).toDouble(),
      columns: json['columns'] ?? 1,

      fontSize: (json['size'] ?? 14).toDouble(),
      fontWeight: json['weight'] ?? 'normal',
      textAlign: json['align'] ?? 'left',

      autoPlay: json['autoPlay'] ?? false,
      loop: json['loop'] ?? false,
    );
  }
}