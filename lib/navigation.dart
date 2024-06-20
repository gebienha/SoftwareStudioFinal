// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'screens/filter/filters_page.dart';
// import 'screens/home/home_screen.dart';
// import 'screens/category/category_screen.dart';
// import 'screens/details/details_screen.dart';
// import 'screens/products/categorized_product_screen.dart';

// final routerConfig = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const HomeScreen(),
//     ),
//     GoRoute(
//       path: '/categories',
//       builder: (context, state) => const CategoriesScreen(),
//       routes: [
//         GoRoute(
//           path: 'filters',
//           builder: (context, state) => const FiltersPage(),
//         ),
//         GoRoute(
//           path: ':categoryId/products',
//           builder: (context, state) => CategorizedProductsScreen(
//             categoryId: state.pathParameters['categoryId']!,
//           ),
//         ),
//       ],
//     ),
//   ],
//   initialLocation: '/',
//   debugLogDiagnostics: true,
//   errorBuilder: (context, state) => Scaffold(
//     body: Center(
//       child: Text('Page not found: ${state.uri.path}'),
//     ),
//   ),
// );

// class NavigationService {
//   final GoRouter _router = routerConfig;

//   GoRouter get router => _router;

//   void goHome() {
//     _router.go('/');
//   }

//   void goCategory() {
//     _router.go('/categories');
//   }

//   void pushFiltersOnHome({required BuildContext context}) {
//     _router.go('/categories/filters');
//   }

//   void goProductsOnCategory({required String categoryId}) {
//     _router.go('/categories/$categoryId/products');
//   }
// }
