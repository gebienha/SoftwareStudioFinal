import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
class Popular {
  final int id;
  final String title;
  final List<String> images;
  final List<Color> colors;

  Popular({
    required this.id,
    required this.images,
    required this.colors,
    required this.title,
  });
}

// Our demo Populars

List<Popular> demoPopulars = [
  Popular(
    id: 1,

    images: [
      "assets/images/cliniquelogo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Clinique",
  ),
  Popular(
    id: 2,
    images: [
      "assets/images/laneigelogo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Laneige",
  ),
  Popular(
    id: 3,
    images: [
      "assets/images/aveenologo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Aveeno",
  ),
  Popular(
    id: 4,
    images: [
      "assets/images/ordinarylogo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "The ordinary",
  ),
  Popular(
    id: 5,
    images: [
      "assets/images/ceravelogo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Cerave",
  ),
];

