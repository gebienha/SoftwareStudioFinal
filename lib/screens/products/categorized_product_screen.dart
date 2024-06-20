// import 'package:flutter/material.dart';
// import 'package:shop_app/components/product_card.dart';
// import 'package:shop_app/models/Product.dart';
// import 'package:provider/provider.dart';
// import '../../../main.dart';
// import '../filter/state/filtered_products_notifier.dart';
// import '../details/details_screen.dart';

// class CategorizedProductsScreen extends StatelessWidget {
//   static const String routeName = "/products";

//   final String categoryId;

//   const CategorizedProductsScreen({
//     Key? key,
//     required this.categoryId,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final category = dummyCategories[categoryId]!;
//     final filteredProducts =
//         Provider.of<FilteredProductsNotifier>(context, listen: false)
//             .filteredProducts;
//     final products = filteredProducts
//         .where((product) => product.categories.contains(category.id))
//         .toList();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(category.title), // Use category name as the title
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: GridView.builder(
//             itemCount: products.length,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200,
//               childAspectRatio: 0.7,
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 16,
//             ),
//             itemBuilder: (context, index) => ProductCard(
//               product: products[index],
//               onPress: () => Navigator.pushNamed(
//                 context,
//                 DetailsScreen.routeName,
//                 arguments: ProductDetailsArguments(product: products[index]),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
