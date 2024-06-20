import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/moredetail/seemoredetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';
import 'package:shop_app/screens/favorite/service/firestore.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  late bool isFavourite;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    isFavourite = widget.product.isFavourite;
  }

  void toggleFavourite() async {
    setState(() {
      isFavourite = !isFavourite;
      widget.product.isFavourite = isFavourite; // Update the product's isFavourite status
    });

    if (isFavourite) {
      await _firestoreService.addFavorite(widget.product.id);
    } else {
      await _firestoreService.removeFavorite(widget.product.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0), // Adjust top padding for title
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Horizontal padding for other components
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.product.price.toStringAsFixed(2)}', // Displaying price with $ sign
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              GestureDetector(
                onTap: toggleFavourite,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isFavourite
                        ? const Color(0xFFFFE6E6)
                        : const Color(0xFFF5F6F9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    colorFilter: ColorFilter.mode(
                      isFavourite
                          ? const Color(0xFFFF4848)
                          : const Color(0xFFDBDEE4),
                      BlendMode.srcIn,
                    ),
                    height: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Vertical padding for description
          child: Text(
            widget.product.description,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20), // Adjust bottom padding for "See More Detail"
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SeeMoreDetailScreen.routeName,
                arguments: ProductDetailsArguments(product: widget.product),
              );
            },
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
