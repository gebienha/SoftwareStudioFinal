import 'package:flutter/material.dart';
import 'skincare_routine.dart';
import 'routine_detail.dart';

class PersonalizedSkincareRoutineScreen extends StatelessWidget {
  static const routeName = '/personalized-skincare-routine';

  @override
  Widget build(BuildContext context) {
    final skinTypeId = ModalRoute.of(context)!.settings.arguments as String;
    final skinType = skinTypeCategories.firstWhere((category) => category.id == skinTypeId);

    // Example skincare routine data for each skin type with day and night routines
    final Map<String, Map<String, List<String>>> skincareRoutines = {
      '1': {
        'Day': ['Cleanser', 'Toner', 'Serum', 'Moisturizer','Sunscreen'],
        'Night': ['Cleanser', 'Toner', 'Serum', 'Face oil'],
      },
      '2': {
        'Day': ['Hydrating Cleanser', 'Toner', 'Serum', 'Moisturizer', 'Sunscreen'],
        'Night': ['Hydrating Cleanser', 'Toner', 'Serum', 'Night Cream', 'Face Oil'],
      },
      '3': {
        'Day': ['Cleanser', 'Toner', 'Serum', 'Moisturizer','Sunscreen'],
        'Night': ['Cleanser', 'Toner', 'Serum', 'Face Oil','Night Cream'],
      },
      '4': {
        'Day': ['Cleanser', 'Toner', 'Serum', 'Moisturizer','Sunscreen'],
        'Night': ['Cleanser', 'Toner', 'Serum', 'Face Oil','Night Cream'],
      },
    };

    final dayRoutine = skincareRoutines[skinTypeId]?['Day'] ?? [];
    final nightRoutine = skincareRoutines[skinTypeId]?['Night'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${skinType.title} Skin Routine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Day Routine', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: dayRoutine.length,
                itemBuilder: (context, index) {
                  final step = dayRoutine[index];
                  return ListTile(
                    title: Text(step),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SkincareRoutineStepScreen.routeName,
                        arguments: {'skinTypeId': skinTypeId, 'stepId': step, 'routineType': 'Day'},
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text('Night Routine', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: nightRoutine.length,
                itemBuilder: (context, index) {
                  final step = nightRoutine[index];
                  return ListTile(
                    title: Text(step),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SkincareRoutineStepScreen.routeName,
                        arguments: {'skinTypeId': skinTypeId, 'stepId': step, 'routineType': 'Night'},
                      );
                    },
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
