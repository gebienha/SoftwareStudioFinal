import 'package:flutter/material.dart';
import '../../../constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: 240, // Reduced height to make more room
          width: 240,
        ),
        Spacer(),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10), // Reduced padding
          child: Column(
            children: [
              Text(
                "BeautyBlendr",
                style: TextStyle(
                  fontSize: 30, // Reduced font size
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 10),
              Text(
                text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14, // Reduced font size
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
