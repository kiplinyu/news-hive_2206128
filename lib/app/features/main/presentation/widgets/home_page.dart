import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_hive/app/features/main/presentation/widgets/all_news_widget.dart';
import 'package:news_hive/app/features/main/presentation/widgets/image_click_widget.dart';
import 'package:news_hive/data/dummy/dummy_carousel.dart';

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
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            pauseAutoPlayInFiniteScroll: true,
            padEnds: false,
          ),
          items:
              carouselItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ImageClickWidget(
                    imageUrl: item['image'],
                    onTap: item['onTap'],
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 12),
        Text(
          "All News",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        AllNewsWidget(),
      ],
    );
  }
}
