import 'package:flutter/material.dart';

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
      body: PageView(
        controller: controller,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.translationValues((0-_currentPageValue) * 0.7 * screenWidth, 0, 0),
                child: Icon(Icons.add, size: 100.0),
              ),
              SizedBox(height: 50),
              Transform(
                transform: Matrix4.translationValues((0-_currentPageValue) * 1.5 * screenWidth, 0, 0),
                child: Text("Press the add button at the upper right corner to track new expense.",
                style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 50),
              Transform(
                transform: Matrix4.translationValues((0-_currentPageValue) * 2.5 * screenWidth, 0, 0),
                child: ElevatedButton(
                  onPressed: () => controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOutExpo),
                  child: Text("Next"),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.translationValues((1-_currentPageValue) * 1.5 * screenWidth, 0, 0),
                child: Icon(Icons.swipe, size: 100.0),
              ),
              SizedBox(height: 50),
              Transform(
                transform: Matrix4.translationValues((1-_currentPageValue) * 1.5 * screenWidth, 0, 0),
                child: Text("Swipe a tracked expense left or right to delete it.",
                style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 50),
              Transform(
                transform: Matrix4.translationValues((1-_currentPageValue) * 2.5 * screenWidth, 0, 0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Done"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}