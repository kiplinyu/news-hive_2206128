import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  void _onSearchChanged(String value) {
    setState(() {
      _searchText = _searchText;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {
                    // show filter bottom sheet/modal
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("Headlines")),
                TextButton(onPressed: () {}, child: Text("Top Stories")),
                TextButton(onPressed: () {}, child: Text("Similar News")),
              ],
            ),
            // SizedBox(
            //   child: CarouselView(itemExtent: itemExtent, children: children),
            // )
          ],
        ),
      ),
    );
  }
}
