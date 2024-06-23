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
        // color: Colors.white, // Change background to white for better contrast
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
              TextSpan(
                text: "Hello, User!\n",
                style: TextStyle(
                  fontSize: 20, // Smaller font size for the first line
                  color: Theme.of(context).colorScheme.onSecondaryContainer
                ),
              ),
              TextSpan(
                text: "Search for your perfect ",
                style: TextStyle(
                  fontSize: 24, // Bigger font size for the second line
                  color: Theme.of(context).colorScheme.onSecondaryContainer
                ),
              ),
              TextSpan(
                text: "skincare",
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onPrimaryContainer, // Use the specific green color
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
