import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalCard extends StatelessWidget {
  final String icon;
  final VoidCallback press;

  const SocalCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: press,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(12),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
