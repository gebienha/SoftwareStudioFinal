import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import the package

class UserManual extends StatefulWidget {
  static const routeName = '/user_manual';

  @override
  _UserManualState createState() => _UserManualState();
}

class _UserManualState extends State<UserManual> {
  PageController controller = PageController();
  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      setState(() {
        _currentPageValue = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: 6, // Number of pages
              itemBuilder: (context, index) {
                return _buildPage(
                  index,
                  IconsData.data[index], // Use your icon data list here
                  TextData.data[index], // Use your text data list here
                  screenWidth,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          SmoothPageIndicator(
            controller: controller,
            count: 6,
            effect: ExpandingDotsEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPage(int index, IconData iconData, String text, double screenWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: Offset((index - _currentPageValue) * 0.5 * screenWidth, 0), // Adjusted speed
          child: Icon(
            iconData,
            size: 100.0,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        SizedBox(height: 50),
        Transform.translate(
          offset: Offset((index - _currentPageValue) * 1.2 * screenWidth, 0), // Adjusted speed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 50),
        Transform.translate(
          offset: Offset((index - _currentPageValue) * 2.0 * screenWidth, 0), // Adjusted speed
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: IconButton(
                onPressed: () {
                  if (index < 5) { // Check if it's not the last page
                    controller.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOutExpo,
                    );
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                icon: Icon(index < 5 ? Icons.arrow_forward : Icons.check, size: 30),
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IconsData {
  static const List<IconData> data = [
    Icons.quiz_rounded,
    Icons.chat,
    Icons.search_outlined,
    Icons.track_changes,
    Icons.favorite_border,
    Icons.swipe,
  ];
}

class TextData {
  static const List<String> data = [
    "Take the quiz and discover your skin type!",
    "Share your concerns with our AI Chat for a worry-free consultation!",
    "Discover our top pick for your skincare routine based on category and your unique skin type!",
    "Track your skin's journey with our Skin Tracker!",
    "Organize your favorite products for future purchases!",
    "Embrace your skin's unique qualities and elevate your skincare routine!",
  ];
}
