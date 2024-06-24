import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imageUrl; // Change to assetImage

  const Category({
    required this.id,
    required this.title,
    required this.color,
    required this.imageUrl, // Change to assetImage
  });
}

