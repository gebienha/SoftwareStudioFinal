// import 'dart:async';
// import '../components/size_config.dart';
// import 'package:flutter/material.dart';
// import 'land.dart';
// import 'sun.dart';
// import 'package:shop_app/theme.dart';
// import 'package:shop_app/theme_model.dart';
// import 'skincare_routine.dart';
// import 'routine_detail.dart';
// import 'routinestep_detail.dart';

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   bool isFullSun = false;
//   bool isDayMood = true;
//   Duration _duration = Duration(seconds: 1);
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   bool routineSelected = false;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         isFullSun = true;
//       });
//     });
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _fadeAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void changeMood(bool isDay) {
//     if (isDay) {
//       setState(() {
//         isDayMood = true;
//       });
//       Future.delayed(Duration(milliseconds: 300), () {
//         setState(() {
//           isFullSun = true;
//         });
//       });
//     } else {
//       setState(() {
//         isFullSun = false;
//       });
//       Future.delayed(Duration(milliseconds: 300), () {
//         setState(() {
//           isDayMood = false;
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final skinTypeId = ModalRoute.of(context)!.settings.arguments as String?;
//     if (skinTypeId == null) {
//       return Scaffold(
//         body: Center(
//           child: Text('Skin type ID is required'),
//         ),
//       );
//     }

//     final skinType = skinTypeCategories.firstWhere(
//       (category) => category.id == skinTypeId,
//       orElse: () => throw Exception('Skin type not found'),
//     );
//     List<Color> lightBgColors = [
//       Color(0xFF8C2480),
//       Color(0xFFCE587D),
//       Color(0xFFFF9485),
//       if (isFullSun) Color(0xFFFF9D80),
//     ];
//     var darkBgColors = [
//       Color(0xFF0D1441),
//       Color(0xFF283584),
//       Color(0xFF376AB2),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '${skinType.title} Skin Routine',
//           style: const TextStyle(
//             color: Color(0xFF60C6A2),
//             fontSize: 18.0,
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: AnimatedContainer(
//       duration: _duration,
//       curve: Curves.easeInOut,
//       width: double.infinity,
//       height: SizeConfig.screenHeight,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: isDayMood ? lightBgColors : darkBgColors,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Sun(duration: _duration, isFullSun: isFullSun),
//           Land(),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: SafeArea(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   VerticalSpacing(of: 50),
//                   Text(
//                       "Select your routine!",
//                       style: Theme.of(context).textTheme.headline3?.copyWith(
//                           fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                   VerticalSpacing(),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               routineSelected = true;
//                             });
//                             changeMood(true);
//                             _controller.forward();
//                             Navigator.pushNamed(
//                               context,
//                               SkincareRoutineStepScreen.routeName,
//                               arguments: {'skinTypeId': skinTypeId, 'routineType': 'Day'},
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: lightBgColors,
//                               ),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.wb_sunny, size: 40, color: Colors.white),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   'Day Routine',
//                                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               routineSelected = true;
//                             });
//                             changeMood(false);
//                             _controller.forward();
//                             Navigator.pushNamed(
//                               context,
//                               SkincareRoutineStepScreen.routeName,
//                               arguments: {'skinTypeId': skinTypeId, 'routineType': 'Night'},
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: darkBgColors,
//                               ),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.nights_stay, size: 40, color: Colors.white),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   'Night Routine',
//                                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   VerticalSpacing(of: 10),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//       );
    
//   }
// }
