import 'dart:async';
import '../components/size_config.dart';
import 'package:flutter/material.dart';
import 'land.dart';
import 'sun.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/theme_model.dart';
import 'skincare_routine.dart';
import 'routine_detail.dart';
import 'routinestep_detail.dart';

class PersonalizedSkincareRoutineScreen extends StatefulWidget {
  static const routeName = '/personalized-skincare-routine';

  @override
  _PersonalizedSkincareRoutineScreenState createState() =>
      _PersonalizedSkincareRoutineScreenState();
}

class _PersonalizedSkincareRoutineScreenState
    extends State<PersonalizedSkincareRoutineScreen>
    with SingleTickerProviderStateMixin {
  bool isFullSun = false;
  bool isDayMood = true;
  Duration _duration = Duration(seconds: 1);
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool routineSelected = false;
  bool showArrowButton = false;
  IconData selectedDayIcon = Icons.wb_sunny; // Icon for day routine
  IconData selectedNightIcon = Icons.nights_stay; // Icon for night routine

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isFullSun = true;
      });
    });
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeMood(bool isDay) {
    if (isDay) {
      setState(() {
        isDayMood = true;
        showArrowButton = true;
        selectedDayIcon = Icons.wb_sunny; // Selected day icon
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isFullSun = true;
        });
      });
    } else {
      setState(() {
        isFullSun = false;
        showArrowButton = true;
        selectedNightIcon = Icons.nights_stay; // Selected night icon
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isDayMood = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    final skinTypeId = ModalRoute.of(context)!.settings.arguments as String?;
    if (skinTypeId == null) {
      return Scaffold(
        body: Center(
          child: Text('Skin type ID is required'),
        ),
      );
    }

    final skinType = skinTypeCategories.firstWhere(
      (category) => category.id == skinTypeId,
      orElse: () => throw Exception('Skin type not found'),
    );

    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      if (isFullSun) Color(0xFFFF9D80),
    ];
    var darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${skinType.title} Skin Routine',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 18.0,
          ),
        ),
        // backgroundColor: Colors.white,
      ),
      body: AnimatedContainer(
        duration: _duration,
        curve: Curves.easeInOut,
        width: double.infinity,
        height: SizeConfig.screenHeight, // Now this will work
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDayMood ? lightBgColors : darkBgColors,
          ),
        ),
        child: Stack(
          children: [
            Sun(duration: _duration, isFullSun: isFullSun),
            Land(isDayMood: isDayMood),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalSpacing(of: 100),
                    Text(
                      "Select your routine! ",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    VerticalSpacing(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              routineSelected = true;
                            });
                            changeMood(true);
                            _controller.forward();
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(selectedDayIcon, size: 40, color: Colors.white), // Show selected day icon
                                SizedBox(height: 10),
                                Text(
                                  'Day Routine',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              routineSelected = true;
                            });
                            changeMood(false);
                            _controller.forward();
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(selectedNightIcon, size: 40, color: Colors.white), // Show selected night icon
                                SizedBox(height: 10),
                                Text(
                                  'Night Routine',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (showArrowButton) // Show arrow button conditionally
                      Column(
                        children: [
                          VerticalSpacing(of: 10),
                          GestureDetector(
                            onTap: () {
                              _controller.forward();
                              Navigator.pushNamed(
                                context,
                                SkincareRoutineStepScreen.routeName,
                                arguments: {
                                  'skinTypeId': skinTypeId,
                                  'routineType': isDayMood ? 'Day' : 'Night', // Pass routine type
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(Icons.arrow_forward, color: Colors.black),
                            ),
                          ),
                          VerticalSpacing(of: 10),
                          Text(
                            'Press the button to proceed',
                            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
