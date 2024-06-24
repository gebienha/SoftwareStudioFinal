import 'package:flutter/material.dart';
import 'size_config.dart';

class Land extends StatelessWidget {
  final bool isDayMood;

  const Land({
    Key? key,
    required this.isDayMood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenHeight(-190),
      right: 0,
      child: Image.asset(
        isDayMood ? "assets/images/land_tree_light.png" : "assets/images/land_tree_dark.png",
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        fit: BoxFit.cover, // Cover the entire screen
      ),
    );
  }
}
