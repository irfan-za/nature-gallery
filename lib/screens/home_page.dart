import 'package:flutter/material.dart';
import 'package:nature_gallery/widgets/image_grid.dart';
import 'package:nature_gallery/widgets/search_bar_gallery.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nature Gallery'),
      ),
      body: Column(
        children: [
          SearchBarGallery(onSearch: updateSearchQuery),
          Expanded(
            child: ImageGrid(searchQuery: searchQuery),
          ),
        ],
      ),
    );
  }
}