import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import '../../models/Product.dart';
import 'components/product_description.dart';
import 'components/product_images.dart';
import 'components/top_rounded_container.dart';
import 'components/reviews.dart';
import 'package:provider/provider.dart';

class SeeMoreDetailScreen extends StatelessWidget {
  static String routeName = "/SeeMoreDetails";

  const SeeMoreDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args == null || args is! ProductDetailsArguments) {
      // Handle the error by showing a placeholder or returning early
      return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details", style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18)),
        ),
        body: const Center(
          child: Text("No product details available.", style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18)),
        ),
      );
    }

    final product = args.product;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
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
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    
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
