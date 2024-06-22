import 'package:flutter/material.dart';
import 'package:shop_app/components/favorites_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/favorite/service/firestore.dart';
import 'package:shop_app/screens/init_screen.dart';

import '../details/details_screen.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = '/favorite';

  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Future<List<Product>> favoriteProductsFuture;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    favoriteProductsFuture = _fetchFavoriteProducts();
  }

  Future<List<Product>> _fetchFavoriteProducts() async {
    // Fetch favorite products from Firestore
    List<int> favoriteIds = await _firestoreService.getFavoriteIds();
    // Assuming demoProducts is a list of all available products
    List<Product> favoriteProducts = demoProducts
        .where((product) => favoriteIds.contains(product.id))
        .toList();

    for (var product in favoriteProducts) {
      product.isFavourite = true;
    }

    return favoriteProducts;
  }

  void updateFavoriteStatus() {
    setState(() {
      favoriteProductsFuture = _fetchFavoriteProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the home screen
            Navigator.pushNamed(context, InitScreen.routeName);
          },
        ),
        title: Text(
          "Favorites",
          style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FutureBuilder<List<Product>>(
                  future: favoriteProductsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("An error occurred."));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          "No favorite products yet.",
                          //style: Theme.of(context).textTheme.subtitle1,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0), // Add space after each FavoriteCard
                          child: FavoriteCard(
                            product: snapshot.data![index],
                            onPress: () => Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(
                                  product: snapshot.data![index]),
                            ),
                            onFavoriteToggled: updateFavoriteStatus,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
