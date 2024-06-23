import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/routine_step.dart';
import 'routine_step.dart';

// Define skin type categories
final List<Category> skinTypeCategories = [
  Category(id: '1', title: 'Oily', color: Colors.blue),
  Category(id: '2', title: 'Dry', color: Colors.red),
  Category(id: '3', title: 'Combination', color: Colors.green),
  Category(id: '4', title: 'Normal', color: Colors.purple),
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
        title: Text('Skincare Routines', style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer, fontSize: 18)),
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
                child: child,
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

// Category model
class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
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
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: category.color.withOpacity(0.7),
          color: Theme.of(context).colorScheme.background
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
