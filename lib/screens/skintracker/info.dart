import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';  // Import the package

class TutorialPage extends StatefulWidget {
  static const routeName = '/skin-tracker-tutorial-page';

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
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
            child: PageView(
              controller: controller,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(
                          (0 - _currentPageValue) * 0.5 * screenWidth, 0, 0), // Adjusted speed
                      child: Icon(Icons.add, size: 100.0, color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: 50),
                    Transform(
                      transform: Matrix4.translationValues(
                          (0 - _currentPageValue) * 1.2 * screenWidth, 0, 0), // Adjusted speed
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Press the add button at the upper right corner to track a new skin condition.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Transform(
                      transform: Matrix4.translationValues(
                          (0 - _currentPageValue) * 2.0 * screenWidth, 0, 0), // Adjusted speed
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: IconButton(
                            onPressed: () => controller.nextPage(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeInOutExpo),
                            icon: Icon(Icons.arrow_forward, size: 30),
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(
                          (1 - _currentPageValue) * 0.5 * screenWidth, 0, 0), // Adjusted speed
                      child: Icon(Icons.swipe, size: 100.0, color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: 50),
                    Transform(
                      transform: Matrix4.translationValues(
                          (1 - _currentPageValue) * 1.2 * screenWidth, 0, 0), // Adjusted speed
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Swipe a tracked condition left or right to delete it.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Transform(
                      transform: Matrix4.translationValues(
                          (1 - _currentPageValue) * 2.0 * screenWidth, 0, 0), // Adjusted speed
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.check, size: 30),
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SmoothPageIndicator(
            controller: controller,  // PageController
            count: 2,
            effect: WormEffect(
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
}
