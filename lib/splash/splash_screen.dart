import 'package:flutter/material.dart';
import 'components/splash_content.dart';
import '../../constants.dart';
import '../sign_in/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Find skincares\nyou’ll love.",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people connect with the best\nskincare products around the world.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Discover and review skincare easily.\nStay informed with BeautyBlendr.",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Color(0xFFC3FDDF), Colors.white],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => AnimatedContainer(
                            duration: kAnimationDuration,
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? Color(0xFF60C6A2) // Changed to green
                                  : const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF60C6A2), // Green color for the button
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          minimumSize: Size(60, 60), // Make the button smaller
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Rounded button
                          ),
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.white), // Arrow icon for the button
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
