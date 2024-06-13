import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../details/details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter the demoProducts to get only the favorite products
    final favoriteProducts = demoProducts.where((product) => product.isFavourite).toList();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Favorites",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: favoriteProducts.isNotEmpty
                  ? GridView.builder(
                      itemCount: favoriteProducts.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) => ProductCard(
                        product: favoriteProducts[index],
                        onPress: () => Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          arguments: ProductDetailsArguments(product: favoriteProducts[index]),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        "No favorite products yet.",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
