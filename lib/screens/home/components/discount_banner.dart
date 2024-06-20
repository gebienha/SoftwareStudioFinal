import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white, // Change background to white for better contrast
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              const TextSpan(
                text: "Hello, User!\n",
                style: TextStyle(
                  fontSize: 16, // Smaller font size for the first line
                ),
              ),
              TextSpan(
                text: "Search for your perfect ",
                style: const TextStyle(
                  fontSize: 24, // Bigger font size for the second line
                ),
              ),
              TextSpan(
                text: "skincare",
                style: TextStyle(
                  fontSize: 24,
                  color: const Color(0xFF60C6A2), // Use the specific green color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
