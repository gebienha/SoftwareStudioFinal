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
  const Category(id: '1', title: 'Oily', image: 'assets/oily_skin.png'),
  const Category(id: '2', title: 'Dry', image: 'assets/dry_skin.png'),
  const Category(id: '3', title: 'Combination', image: 'assets/combination_skin.png'),
  const Category(id: '4', title: 'Normal', image: 'assets/normal_skin.png'),
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

          // Calculate the row number of the current category
          int rowIndex = index ~/ 2;

          return AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final animationValue = _animationController.value;

              // Adjust the Interval based on the row number
              final slideInAnimation = Tween<Offset>(
                begin: const Offset(0.0, 4),
                end: const Offset(0.0, 0.0),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    (rowIndex / (skinTypeCategories.length / 2)) * 0.5, // Adjusted Interval
                    1.0,
                    curve: Curves.easeInOutCubic,
                  ),
                ),
              );

              return SlideTransition(
                position: slideInAnimation,
                child: child!,
              );
            },
            child: CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectSkinType(context, category);
              },
            ),
          );
        },
      ),
    );
  }
}

// CategoryGridItem widget
class CategoryGridItem extends StatelessWidget {
  final Category category;
  final VoidCallback onSelectCategory;

  const CategoryGridItem({
    required this.category,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectCategory,
      child: Container(
        padding: const EdgeInsets.all(15),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category.image,
              height: 80,
              width: 80,
            ),
            SizedBox(height: 10),
            Text(
              category.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
