import 'package:flutter/material.dart';
import 'package:shop_app/models/Cheap.dart';
import 'package:shop_app/components/cheap_card.dart';
class CheapBrandsScreen extends StatelessWidget {
  const CheapBrandsScreen({super.key});

  static String routeName = "/cheap_brands";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affordable Brands in 2024", style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: demoCheap.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 0.8,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => CheapCard(
              cheap: demoCheap[index],
            ),
          ),
        ),
      ),
    );
  }
}
