import 'package:flutter/material.dart';
import 'package:shop_app/models/Popular.dart';
import 'package:shop_app/components/brand_card.dart';
class PopularBrandsScreen extends StatelessWidget {
  const PopularBrandsScreen({super.key});

  static String routeName = "/popular_brands";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Brands in 2024", style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: demoPopulars.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 0.85,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => BrandCard(
              popular: demoPopulars[index],
            ),
          ),
        ),
      ),
    );
  }
}
