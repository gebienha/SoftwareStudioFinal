import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'size_config.dart';

class Sun extends StatelessWidget {
  const Sun({
    Key? key,
    required Duration duration,
    required this.isFullSun,
    required this.isDayMood,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final bool isFullSun;
  final bool isDayMood;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      curve: Curves.easeInOut,
      left: getProportionateScreenWidth(300),
      bottom: getProportionateScreenWidth(isFullSun ? -45 : -250),
      child: isDayMood ? SvgPicture.asset("assets/icons/Sun.svg") : SvgPicture.asset("assets/icons/Sun.svg"),
    );
  }
}
