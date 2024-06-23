import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class Cheap {
  final int id;
  final String title;
  final List<String> images;
  final List<Color> colors;

  Cheap({
    required this.id,
    required this.images,
    required this.colors,
    required this.title,
  });
}

// Our demo Populars

List<Cheap> demoCheap = [
  Cheap(
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
  Cheap(
    id: 2,
    images: [
      "assets/images/byomalogo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Byoma",
  ),
  Cheap(
    id: 3,
    images: [
      "assets/images/elflogo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Elf",
  ),
  Cheap(
    id: 4,
    images: [
      "assets/images/olaylogo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Olay",
  ),
  Cheap(
    id: 5,
    images: [
      "assets/images/glowlogo.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Glow",
  ),
];

