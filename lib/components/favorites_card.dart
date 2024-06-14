import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../models/Product.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 0.7,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Container for the picture
            Container(
              height: width * aspectRatio,
              width: width * aspectRatio,
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                product.images[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // To handle overflow
                  ),
                  const SizedBox(height: 8),
                  // Product Description in a small box
                  Container(
                    padding: const EdgeInsets.all(0),
                    constraints: BoxConstraints(
                      maxHeight: 50, // Limit the height
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        // maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: product.isFavourite
                      ? kPrimaryColor.withOpacity(0.15)
                      : kSecondaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "assets/icons/Heart Icon_2.svg",
                  colorFilter: ColorFilter.mode(
                    product.isFavourite
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
