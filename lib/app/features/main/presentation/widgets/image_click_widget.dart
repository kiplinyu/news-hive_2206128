import 'package:flutter/material.dart';

class ImageClickWidget extends StatefulWidget {
  final String imageUrl;
  final VoidCallback? onTap;

  const ImageClickWidget({super.key, required this.imageUrl, this.onTap});

  @override
  State<ImageClickWidget> createState() => _ImageClickWidgetState();
}

class _ImageClickWidgetState extends State<ImageClickWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Opsional
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300], // Placeholder bg
          ),
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Icon(Icons.broken_image));
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
