import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import '../../models/category.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    Key? key,
    required this.category,
    required this.onSelectCategory,
  }) : super(key: key);

  final Category category;
  final VoidCallback onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: kPrimaryColor,
      borderRadius: BorderRadius.circular(16), // Adjust the border radius here
      child: Stack(
        children: [
          Hero(
            tag: category.id, // Should match the tag in MealDetailsPage
            child: ClipRRect( // ClipRRect to clip the image with rounded corners
              borderRadius: BorderRadius.circular(16), // Adjust the border radius here
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: category.imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), // Adjust the border radius here
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
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
