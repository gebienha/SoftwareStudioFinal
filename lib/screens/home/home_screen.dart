import 'package:flutter/material.dart';
import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';
import 'components/search_field.dart'; 
import 'components/home_drawer.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';

import 'package:flutter/foundation.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/favorite/service/firestore.dart';

class FavoriteProvider with ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  final FirestoreService _firestoreService = FirestoreService();

  Future<void> fetchFavoriteProducts() async {
    List<int> favoriteIds = await _firestoreService.getFavoriteIds();
    _favoriteProducts = demoProducts.where((product) => favoriteIds.contains(product.id)).toList();

    for (var product in _favoriteProducts) {
      product.isFavourite = true;
    }

    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(Product product) async {
    product.isFavourite = !product.isFavourite;

    if (product.isFavourite) {
      await _firestoreService.addFavorite(product.id);
    } else {
      await _firestoreService.removeFavorite(product.id);
    }

    await fetchFavoriteProducts();
  }
}


// class HomeScreen extends StatelessWidget {
//   static String routeName = "/home";

//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BeautyBlendr')),
//       drawer: HomeDrawer(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(vertical: 16),
//           child: Column(
//             children: [
//               HomeHeader(),
//               DiscountBanner(),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Center(child: SearchField()), // Add SearchField
//               ),
//               Categories(),
//               SpecialOffers(),
//               SizedBox(height: 20),
//               PopularProducts(),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FavoriteProvider>(context, listen: false).fetchFavoriteProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BeautyBlendr', style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18)),
      ),
      drawer: HomeDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              DiscountBanner(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(child: SearchField()), // Add SearchField
              ),
              Categories(),
              SpecialOffers(),
              SizedBox(height: 20),
              PopularProducts(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
