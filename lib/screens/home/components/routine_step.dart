
import 'package:flutter/material.dart';
import 'skincare_routine.dart';
import 'routine_detail.dart';
import 'routinestep_detail.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/theme_model.dart';

class PersonalizedSkincareRoutineScreen extends StatelessWidget {
  static const routeName = '/personalized-skincare-routine';

  @override
  Widget build(BuildContext context) {
    final skinTypeId = ModalRoute.of(context)!.settings.arguments as String;
    final skinType = skinTypeCategories.firstWhere((category) => category.id == skinTypeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${skinType.title} Skin Routine',
          style: const TextStyle(
            color: Color(0xFF60C6A2),
            fontSize: 18.0,
          ),
        ),
        //backgroundColor: Color(0xFF60C6A2),
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 0, 255, 162).withOpacity(0.3), // Light orange for the left side
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 3, 84, 62).withOpacity(0.8), // Light blue for the right side
                ),

              ),
            ],
          ),
          Padding(
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
                        Navigator.pushNamed(
                          context,
                          SkincareRoutineStepScreen.routeName,
                          arguments: {'skinTypeId': skinTypeId, 'routineType': 'Day'},
                        );
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.wb_sunny, size: 80, color: Color.fromARGB(255, 0, 0, 0)),
                          SizedBox(height: 10),
                          Text('Day Routine', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SkincareRoutineStepScreen.routeName,
                          arguments: {'skinTypeId': skinTypeId, 'routineType': 'Night'},
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.nights_stay, size: 80, color: Color.fromARGB(255, 255, 255, 255)),
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
        ],
      ),
    );
  }
}
