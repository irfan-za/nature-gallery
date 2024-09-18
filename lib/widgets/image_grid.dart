import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final String searchQuery;

  ImageGrid({super.key, required this.searchQuery});

  final List<Map<String, String>> images = [
  {'url': 'https://images.unsplash.com/photo-1542281286-9e0a16bb7366', 'title': 'Sunset'},
  {'url': 'https://images.unsplash.com/photo-1497436072909-60f360e1d4b1', 'title': 'Blue Lake'},
  {'url': 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'title': 'Night Mountains'},
  {'url': 'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05', 'title': 'Green Valley'},
  {'url': 'https://images.unsplash.com/photo-1469474968028-56623f02e42e', 'title': 'Sunny Hills'},
  {'url': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0', 'title': 'Man in sunset'},
  {'url': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb', 'title': 'Rocky Beach'},
  {'url': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e', 'title': 'Ocean Waves'},
  {'url': 'https://images.unsplash.com/photo-1494783367193-149034c05e8f', 'title': 'Long Road'},
];

  @override
  Widget build(BuildContext context) {
    final filteredImages = images.where((image) =>
        image['title']!.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: filteredImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: filteredImages[index]['url'],
            );
          },
          child: Hero(
            tag: filteredImages[index]['url']!,
            child: Card( 
              clipBehavior: Clip.antiAlias, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                fit: StackFit.expand, 
                children: [
                  Image.network(
                    filteredImages[index]['url']!,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.black54,
                      child: Text(
                        filteredImages[index]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
