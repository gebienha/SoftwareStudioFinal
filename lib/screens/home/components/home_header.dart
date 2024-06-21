import 'package:flutter/material.dart';
import 'package:shop_app/screens/skintracker/skin_tracker.dart';
import 'icon_btn_with_counter.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconBtnWithCounter(
              svgSrc: "assets/icons/calendar.svg",
              press: () {
                Navigator.pushNamed(
                  context,
                  SkinTracker.routeName,
                ); // Add your navigation or action for settings here
              },
              color: Colors.white, // White icon color
              backgroundColor: const Color(0xFFE0E0E0), // Lighter gray background
            ),
          ),
        ],
      ),
    );
  }
}
