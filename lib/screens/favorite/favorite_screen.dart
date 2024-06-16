import 'package:flutter/material.dart';
import 'package:shop_app/components/favorites_card.dart';
import 'package:shop_app/models/Product.dart';

import '../details/details_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<Product> favoriteProducts;

  @override
  void initState() {
    super.initState();
    favoriteProducts = demoProducts.where((product) => product.isFavourite).toList();
  }

  void updateFavoriteStatus() {
    setState(() {
      favoriteProducts = demoProducts.where((product) => product.isFavourite).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  ? ListView.builder(
                      itemCount: favoriteProducts.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0), // Add space after each FavoriteCard
                        child: FavoriteCard(
                          product: favoriteProducts[index],
                          onPress: () => Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(product: favoriteProducts[index]),
                          ),
                          onFavoriteToggled: updateFavoriteStatus,
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        "No favorite products yet.",
                        //style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
