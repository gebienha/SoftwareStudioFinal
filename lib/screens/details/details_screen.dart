import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Review.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/add_review_page.dart';
import 'package:shop_app/screens/details/components/product_description.dart';
import 'package:shop_app/screens/details/components/product_images.dart';
import 'package:shop_app/screens/details/components/reviews.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args == null || args is! ProductDetailsArguments) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Details",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer, fontSize: 18),
          ),
        ),
        body: Center(
          child: Text(
            "No product details available.",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer, fontSize: 18),
          ),
        ),
      );
    }

    final product = (args as ProductDetailsArguments).product;
    final reviewsProvider = Provider.of<ReviewsProvider>(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // backgroundColor: const Color(0xFFF5F6F9),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            // color: Colors.white,
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  // color: const Color(0xFFF6F7F9),
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      Reviews(productId: product.id.toString()), // Pass the product id as String
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AddReviewScreen.routeName,
                              arguments: product.id.toString(), // Pass productId as String
                            );
                          },
                          child: Text("Add Your Review", style: TextStyle(color: Theme.of(context).colorScheme.background)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
