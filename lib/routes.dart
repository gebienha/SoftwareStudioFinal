import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/category/category_screen.dart';
import 'package:shop_app/screens/favorite/favorite_screen.dart';
import 'package:shop_app/screens/products/categorized_product_screen.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/init_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:shop_app/screens/skintracker/info.dart';
import 'package:shop_app/screens/skintracker/skin_tracker.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/details/add_review_page.dart';
import 'package:shop_app/screens/moredetail/seemoredetail.dart';
import 'package:shop_app/screens/AIChat/AIChatScreen.dart';
import 'package:shop_app/screens/questions/quiz.dart';
import 'package:shop_app/models/Review.dart';
import 'package:shop_app/screens/products/popular_brands.dart';
import 'package:shop_app/screens/products/cheap_brands.dart';


final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => ChangeNotifierProvider(
    create: (context) => ReviewsProvider(),
    child: const DetailsScreen(),
  ),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  AddReviewScreen.routeName: (context) => const AddReviewScreen(),
  SeeMoreDetailScreen.routeName: (context) => const SeeMoreDetailScreen(),
  AIChatScreen.routeName: (context) => const AIChatScreen(),
  Quiz.routeName: (context) => const Quiz(),
  CategoriesScreen.routeName: (context) => const CategoriesScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  PopularBrandsScreen.routeName: (context) => const PopularBrandsScreen(),
  CheapBrandsScreen.routeName: (context) => const CheapBrandsScreen(),
  //Conds.routeName: (context) => const Conds(),
  FavoriteScreen.routeName: (context) => const FavoriteScreen(),
  SkinTracker.routeName: (context) =>  SkinTracker(),
  TutorialPage.routeName: (context) => TutorialPage(),
  //AddAvatarPage.routeName: (context) => const AddAvatarPage(),
};

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CategorizedProductsScreen.routeName:
      final categoryId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => CategorizedProductsScreen(categoryId: categoryId),
      );
    // Add other cases for different routes here
    default:
      return MaterialPageRoute(
        builder: (context) => const InitScreen(), // Default screen
      );
  }
}
