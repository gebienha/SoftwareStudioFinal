import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/category/category_screen.dart';
import 'package:shop_app/screens/filter/filters_page.dart';
import 'package:shop_app/screens/products/categorized_product_screen.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/filter/state/filtered_products_notifier.dart';
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
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/details/add_review_page.dart';
import 'package:shop_app/screens/moredetail/seemoredetail.dart';
import 'package:shop_app/screens/AIChat/AIChatScreen.dart';
import 'package:shop_app/screens/questions/quiz.dart';
import 'package:shop_app/models/Review.dart';
import 'package:shop_app/models/Product.dart'; // Ensure Product model is imported

import 'package:shop_app/screens/filter/state/filters_notifier.dart'; // Import FiltersNotifier

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
  CategorizedProductsScreen.routeName: (context) => CategorizedProductsScreen(categoryId: 'all'),

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
  FiltersPage.routeName: (context) => const FiltersPage(),
};
