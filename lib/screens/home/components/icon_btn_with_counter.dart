import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
    this.color = Colors.white,
    this.backgroundColor,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;
  final Color color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(8), // Adjusted padding to make the button smaller
            height: 40, // Adjusted height to make the button smaller
            width: 40, // Adjusted width to make the button smaller
            decoration: BoxDecoration(
              color: backgroundColor ?? const Color(0xFFE0E0E0), // Lighter gray background
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              svgSrc,
              color: color, // Use the specified icon color
            ),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF60C6A2), // Green background for counter
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // White text inside the counter
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
