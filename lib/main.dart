import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';// Import the navigation service
import 'screens/splash/splash_screen.dart';
import 'theme.dart';
import 'models/Review.dart';
import 'models/Product.dart';
import 'screens/category/category_screen.dart';
import 'screens/questions/quiz.dart';
import 'screens/questions/results_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/products/categorized_product_screen.dart';
import 'routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Make sure you have your Firebase options configured
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReviewsProvider()),
        ChangeNotifierProvider(create: (context) => BenderaProvider()),
        ChangeNotifierProvider(create: (context) => QuizSummaryProvider()),
        Provider<NavigationService>(create: (_) => NavigationService()),
        Provider<List<Product>>(create: (_) => demoProducts),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BeautyBlendr',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      onGenerateRoute: generateRoute,
    );
  }
}

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();

  Function(int index)? updateIndex;

  void setUpdateIndexCallback(Function(int index) callback) {
    updateIndex = callback;
  }

  void callUpdateIndex(int index) {
    if (updateIndex != null) {
      updateIndex!(index);
    }
  }
}