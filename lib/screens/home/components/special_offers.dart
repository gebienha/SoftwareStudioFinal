import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/skincare_routine.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/products/popular_brands.dart';
import 'package:shop_app/screens/products/cheap_brands.dart';

import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/Image Banner 5.jpg",
                category: "Skincare Routine",
                press: () {
                  // Navigator.pushNamed(context, ProductsScreen.routeName);
                  Navigator.pushNamed(context,SkincareRoutineScreen.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 2.png",
                category: "Popular in 2024",
                press: () {
                  // Navigator.pushNamed(context, ProductsScreen.routeName);
                  Navigator.pushNamed(context, PopularBrandsScreen.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 3.png",
                category: "Affordable Brands",
                press: () {
                  Navigator.pushNamed(context, CheapBrandsScreen.routeName);
                },
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
