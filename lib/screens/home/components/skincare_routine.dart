import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/routine_step.dart';

// Category model
class Category {
  final String id;
  final String title;
  final String image;

  const Category({
    required this.id,
    required this.title,
    required this.image,
  });
}

// Define skin type categories with images
final List<Category> skinTypeCategories = [
  const Category(id: '1', title: 'Oily', image: "assets/images/oily_skin.jpg"),
  const Category(id: '2', title: 'Dry', image: "assets/images/dry_skin.jpg"),
  const Category(id: '3', title: 'Combination', image: "assets/images/combination_skin.jpg"),
  const Category(id: '4', title: 'Normal', image: "assets/images/normal_skin.png"),
];

class SkincareRoutineScreen extends StatefulWidget {
  const SkincareRoutineScreen({Key? key}) : super(key: key);
  static String routeName = "/skincare-routine";

  @override
  State<SkincareRoutineScreen> createState() => _SkincareRoutineScreenState();
}

class _SkincareRoutineScreenState extends State<SkincareRoutineScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationController.forward();
  }

  void _selectSkinType(BuildContext context, Category category) {
    Navigator.pushNamed(
      context,
      PersonalizedSkincareRoutineScreen.routeName,
      arguments: category.id, // Pass the skin type id as argument
    );
  }

  @override
  Widget build(BuildContext context) {
    _startAnimation();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Skincare Routines',
          style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: skinTypeCategories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = skinTypeCategories[index];

          return GestureDetector(
            onTap: () => _selectSkinType(context, category),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      category.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 40, 16, 12),
                      child: Center(
                        child: Text(
                          category.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
