import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../models/Product.dart'; // Use relative import

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
  int selectedButtonIndex = 0;

  void onButtonPressed(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  Widget getContent() {
    switch (selectedButtonIndex) {
      case 0:
        return Text(widget.product.detail, textAlign: TextAlign.justify);
      case 1:
        return Text(widget.product.recommend, textAlign: TextAlign.justify);
      case 2:
        return Text(widget.product.benefit, textAlign: TextAlign.justify);
      case 3:
        return Text(widget.product.ingredient, textAlign: TextAlign.justify);
      case 4:
        return Text(widget.product.howto, textAlign: TextAlign.justify);
      default:
        return Text(widget.product.detail, textAlign: TextAlign.justify);
    }
  }

  Widget buildClickableText(String text, int index) {
    return GestureDetector(
      onTap: () => onButtonPressed(index),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: selectedButtonIndex == index ? kPrimaryColor : Colors.grey,
              fontWeight: selectedButtonIndex == index ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 30,
            color: selectedButtonIndex == index ? kPrimaryColor : Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 8), // Top padding for title
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Horizontal padding for price
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
                onTap: () {
                  setState(() {
                    widget.product.isFavourite = !widget.product.isFavourite;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.product.isFavourite
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
                      widget.product.isFavourite
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Padding for clickable texts
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildClickableText('Details', 0),
              buildClickableText('Recommended For', 1),
              buildClickableText('Benefits', 2),
              buildClickableText('Ingredients', 3),
              buildClickableText('How To Apply', 4),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Vertical padding for content
          child: getContent(),
        ),
      ],
    );
  }
}
