import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  late PageController _pageController;
  double _currentValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentValue = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentValue = page.toDouble();
              });
            },
            children: [
              TutorialScreen(
                icon: Icons.add,
                text: 'Press Add button at the upper-right corner to track a new expense',
                buttonText: 'Next',
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                sizeWidth: sizeWidth,
                currentPageValue: _currentValue,
              ),
              TutorialScreen(
                icon: Icons.swipe,
                text: 'Swipe a tracked expense left or right to delete it',
                buttonText: 'Done',
                onPressed: () {
                  Navigator.pop(context);
                },
                sizeWidth: sizeWidth,
                currentPageValue: _currentValue,
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(2, (int index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  height: 10.0,
                  width: (index == _currentValue.toInt()) ? 30.0 : 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: (index == _currentValue.toInt())
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class TutorialScreen extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  final IconData icon;
  final double sizeWidth;
  final double currentPageValue;

  const TutorialScreen({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
    required this.icon,
    required this.sizeWidth,
    required this.currentPageValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double startOffset = 0.0;
    if (currentPageValue == 0) {
      startOffset = 0;
    } else {
      startOffset = 1;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.translationValues((startOffset - currentPageValue) * 0.5 * 0.5 * sizeWidth, 0, 0),
                child: Icon(
                  icon,
                  size: 200,
                ),
              ),
              SizedBox(height: 16.0),
              Transform(
                transform: Matrix4.translationValues((startOffset - currentPageValue) * 1.5 * 0.5 * sizeWidth, 0, 0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.0),
              Transform(
                transform: Matrix4.translationValues((startOffset - currentPageValue) * 2.5 * 0.5 * sizeWidth, 0, 0),
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
