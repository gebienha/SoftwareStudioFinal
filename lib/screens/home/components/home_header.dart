import 'package:flutter/material.dart';
import 'icon_btn_with_counter.dart';
import '../../category/category_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBtnWithCounter(
            svgSrc: "assets/icons/Settings.svg",
            press: () {
              Navigator.pushNamed(
                context,
                CategoriesScreen.routeName);// Add your navigation or action for settings here
            },
            color: Colors.white, // White icon color
            backgroundColor: const Color(0xFFE0E0E0), // Lighter gray background
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
