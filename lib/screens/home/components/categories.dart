import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/favorite/favorite_screen.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/calendar.svg", "text": "Skin Tracker"},
      {"icon": "assets/icons/category.svg", "text": "Category"},
      {"icon": "assets/icons/Heart Icon.svg", "text": "Favorites"},
      {"icon": "assets/icons/Question mark.svg", "text": "Info"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];

    void onPressCategory(String categoryText) {
      // Implement navigation logic here, for example:
      if (categoryText == "Skin Tracker") {
        Navigator.pushNamed(
          context,
          '/skin-tracker',
        );
      } else if (categoryText == "Category") {
        Navigator.pushNamed(context, "/categories");
      }
      else if (categoryText == "Favorites") {
        Navigator.pop(context);
        Navigator.pushNamed(context, "/favorite");
      }
      else if (categoryText == "More") {
        Navigator.pushNamed(
          context,
          '/categorizedproducts',
          arguments: 'all', // Pass the categoryId as argument
        );
      }
      else if (categoryText == "Info") {
        Navigator.pushNamed(
          context,
          '/user_manual',// Pass the categoryId as argument
        );
      }
    }

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
                press: () => onPressCategory(categories[index]["text"]),
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
              color: Theme.of(context).colorScheme.primaryContainer, // Green background
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              icon,
              color: Theme.of(context).colorScheme.onPrimaryContainer, // White icon
            ),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
        ],
      ),
    );
  }
}
