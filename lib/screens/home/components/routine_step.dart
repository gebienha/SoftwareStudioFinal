import 'package:flutter/material.dart';
import 'skincare_routine.dart';

class PersonalizedSkincareRoutineScreen extends StatelessWidget {
  static const routeName = '/personalized-skincare-routine';

  @override
  Widget build(BuildContext context) {
    final skinTypeId = ModalRoute.of(context)!.settings.arguments as String;
    final skinType = skinTypeCategories.firstWhere((category) => category.id == skinTypeId);

    // Example skincare routine data for each skin type
    final Map<String, List<String>> skincareRoutines = {
      '1': ['Cleanser', 'Toner', 'Moisturizer', 'Sunscreen'],
      '2': ['Hydrating Cleanser', 'Serum', 'Moisturizer', 'Sunscreen'],
      '3': ['Gentle Cleanser', 'Toner', 'Moisturizer', 'Sunscreen'],
      '4': ['Cleanser', 'Toner', 'Light Moisturizer', 'Sunscreen'],
    };

    final routine = skincareRoutines[skinTypeId] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${skinType.title} Skin Routine'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: routine.length,
        itemBuilder: (context, index) {
          final step = routine[index];

          return ListTile(
            title: Text(step),
            onTap: () {
              Navigator.pushNamed(
                context,
                SkincareRoutineScreen.routeName,
                arguments: {'skinTypeId': skinTypeId, 'stepId': step},
              );
            },
          );
        },
      ),
    );
  }
}
