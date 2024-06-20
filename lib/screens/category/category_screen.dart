import 'package:flutter/material.dart';
import '../../../models/Product.dart';
import '../../models/category.dart';
import 'category_grid_item.dart';
import '../../screens/products/categorized_product_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static String routeName = "/categories";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
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

  void _selectCategory(BuildContext context, Category category) {
    Navigator.pushNamed(
      context,
      CategorizedProductsScreen.routeName,
      arguments: category.id, // Pass the categoryId as argument
    );
  }

  @override
  Widget build(BuildContext context) {
    _startAnimation();

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: dummyCategories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = dummyCategories.values.toList()[index];

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
                    (rowIndex / (dummyCategories.length / 2)) * 0.5, // Adjusted Interval
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
                _selectCategory(context, category);
              },
            ),
          );
        },
      ),
    );
  }
}
