// import 'package:flutter/material.dart';

// class SkincareRoutineStepDetailScreen extends StatelessWidget {
//   final String stepName;
//   final String stepDescription;
//   final Function onNextStep;

//   const SkincareRoutineStepDetailScreen({
//     required this.stepName,
//     required this.stepDescription,
//     required this.onNextStep,
//   });

//   @override
//   Widget build(BuildContext context) {
//     String imagePath = 'assets/images/$stepName.png';

//     return Scaffold(
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   title: Text(stepName),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               imagePath,
//               height: 200,
//             ),
//             SizedBox(height: 20),
//             Text(
//               stepDescription,
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 onNextStep();
//               },
//               child: Text('Next Step'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class SkincareRoutineStepDetailScreen extends StatelessWidget {
  final String stepName;
  final String stepDescription;
  final Function onNextStep;

  const SkincareRoutineStepDetailScreen({
    required this.stepName,
    required this.stepDescription,
    required this.onNextStep,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/$stepName.png';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  stepName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer
                  ),
                ),
              ),
            ),
            Spacer(),
            Image.asset(
              imagePath,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              stepDescription,
              style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSecondaryContainer),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onNextStep();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Text('Next Step', style: TextStyle(color: Theme.of(context).colorScheme.background)),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
