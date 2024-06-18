import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "New"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Top Rated"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20), // Maintain original top and bottom margin
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            categories.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10), // Consistent horizontal padding for all items
              child: CategoryCard(
                icon: categories[index]["icon"],
                text: categories[index]["text"],
                press: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF60C6A2), // Green background
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              icon,
              color: Colors.white, // White icon
            ),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
