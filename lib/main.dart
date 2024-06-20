import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'routes.dart';
import 'theme.dart';
import 'models/Review.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/questions/quiz.dart';
import 'package:shop_app/screens/questions/results_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReviewsProvider()),
        ChangeNotifierProvider(create: (context) => BenderaProvider()),
        ChangeNotifierProvider(create: (context) => QuizSummaryProvider()),
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
