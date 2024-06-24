import 'package:flutter/material.dart';
import 'size_config.dart';
import 'skincare_routine.dart';
import 'routine_detail.dart';
import 'routinestep_detail.dart';

class RoutineIntermediateScreen extends StatelessWidget {
  static const routeName = '/routine-intermediate';

  final String skinTypeId;
  final String routineType;
  final bool isDayMood;

  const RoutineIntermediateScreen({
    Key? key,
    required this.skinTypeId,
    required this.routineType,
    required this.isDayMood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      Color(0xFFFF9D80),
    ];
    var darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];

    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDayMood ? lightBgColors : darkBgColors,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: SizeConfig.screenHeight * 0.25,
              left: SizeConfig.screenWidth * 0.35,
              child: Icon(
                isDayMood ? Icons.wb_sunny : Icons.nights_stay,
                size: 120,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: SizeConfig.screenHeight * 0.15,
              right: SizeConfig.screenWidth * 0.4,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, size: 50, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SkincareRoutineStepScreen.routeName,
                    arguments: {'skinTypeId': skinTypeId, 'routineType': routineType},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
