const String jsonData = '''
{
  "page": {
    "components": [
      {
        "type": "text",
        "value": "Welcome to Anime World",
        "size": 24,
        "weight": "bold",
        "align": "left",
        "padding": 16
      },
      {
        "type": "banner",
        "image": "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=1200&q=80",
        "height": 200,
        "padding": 16,
        "radius": 16
      },
      {
        "type": "text",
        "value": "Top Picks",
        "size": 18,
        "weight": "bold",
        "align": "left",
        "padding": 16
      },
      {
        "type": "carousel",
        "images": [
          "https://images.unsplash.com/photo-1613376023733-0a73315d9b06?w=800&q=80",
          "https://images.unsplash.com/photo-1555680202-c86f0e12f086?w=600&q=80",
          "https://images.unsplash.com/photo-1541562232579-512a21360020?w=800&q=80"
        ],
        "height": 220,
        "autoPlay": true,
        "padding": 0
      },
      {
        "type": "text",
        "value": "Characters & Art",
        "size": 18,
        "weight": "bold",
        "align": "left",
        "padding": 16
      },
      {
        "type": "grid",
        "images": [
           "https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=400&q=80",
           "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400&q=80",
           "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=800&q=80",
           "https://images.unsplash.com/photo-1481026469463-66327c86e544?w=400&q=80"
        ],
        "columns": 2,
        "spacing": 12,
        "padding": 16
      },
      {
        "type": "text",
        "value": "Season Trailer",
        "size": 18,
        "weight": "bold",
        "align": "left",
        "padding": 16
      },
      {
        "type": "video",
        "url": "https://media.w3.org/2010/05/sintel/trailer.mp4",
        "autoPlay": false,
        "height": 220,
        "padding": 16
      }
    ]
  }
}
''';