import 'package:flutter/material.dart';

final List<Map<String, dynamic>> carouselItems = [
  {
    "image":
        "https://images.unsplash.com/photo-1593789198777-f29bc259780e?q=80&w=2070",
    "onTap": () => debugPrint("Tapped Image 1"),
  },
  {
    "image":
        "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?q=80&w=2070",
    "onTap": () => debugPrint("Tapped Image 2"),
  },
  {
    "image":
        "https://images.unsplash.com/photo-1572949645841-094f3a9c4c94?q=80&w=1887",
    "onTap": () => debugPrint("Tapped Image 3"),
  },
  // tambahkan item lainnya
];
