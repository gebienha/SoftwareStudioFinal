import 'package:flutter/material.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/theme_model.dart';
import 'skincare_routine.dart';
import 'routine_detail.dart';
import 'routinestep_detail.dart';

class PersonalizedSkincareRoutineScreen extends StatefulWidget {
  static const routeName = '/personalized-skincare-routine';

  @override
  _PersonalizedSkincareRoutineScreenState createState() => _PersonalizedSkincareRoutineScreenState();
}

class _PersonalizedSkincareRoutineScreenState extends State<PersonalizedSkincareRoutineScreen> {
  bool isDayRoutine = true;
  Duration _duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    final skinTypeId = ModalRoute.of(context)!.settings.arguments as String;
    final skinType = skinTypeCategories.firstWhere((category) => category.id == skinTypeId);

    List<Color> dayBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      Color(0xFFFF9D80),
    ];
    List<Color> nightBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${skinType.title} Skin Routine',
          style: const TextStyle(
            color: Color(0xFF60C6A2),
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: AnimatedContainer(
        duration: _duration,
        curve: Curves.easeInOut,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDayRoutine ? dayBgColors : nightBgColors,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Choose Your Routine', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDayRoutine = true;
                      });
                      Navigator.pushNamed(
                        context,
                        SkincareRoutineStepScreen.routeName,
                        arguments: {'skinTypeId': skinTypeId, 'routineType': 'Day'},
                      );
                    },
                    child: const Column(
                      children: [
                        Icon(Icons.wb_sunny, size: 80, color: Colors.black),
                        SizedBox(height: 10),
                        Text('Day Routine', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDayRoutine = false;
                      });
                      Navigator.pushNamed(
                        context,
                        SkincareRoutineStepScreen.routeName,
                        arguments: {'skinTypeId': skinTypeId, 'routineType': 'Night'},
                      );
                    },
                    child: Column(
                      children: [
                        Icon(Icons.nights_stay, size: 80, color: Colors.white),
                        SizedBox(height: 10),
                        Text('Night Routine', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
