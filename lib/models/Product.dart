import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/moisturizer.png",
      "assets/images/moisturizer1.png",
      "assets/images/moisturizer2.png",
      "assets/images/moisturizer3.png",
      "assets/images/moisturizer4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Tolerriane Fluide Oil Free Moisturizer",
    price: 30.99,
    description: description1,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/pixi.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Pixi Hydrating Milky Serum",
    price: 24,
    description: description2,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/dalba.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "d'Alba White Truffle VEGAN First Spray Serum 100ml",
    price: 36.55,
    description: description3,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/clinique1.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Clinique Moisture Surge™ 100H Auto-Replenishing Hydrator™",
    price: 26,
    description: description4,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/clinique2.png",
      "assets/images/detail_clinique1.png",
      "assets/images/detail_clinique2.png",
      "assets/images/detail_clinique3.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Clinique Smart Clinical Repair™ Wrinkle Correcting Serum",
    price: 64.99,
    description: description5,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/cosrx1.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "COSRX Advanced Snail 96 Mucin Power Essence",
    price: 30.43,
    description: description6,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/laneige1.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Laneige Water Sleeping Mask",
    price: 36.55,
    description: description7,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 8,
    images: [
      "assets/images/cetaphil1.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Cetaphil Bright Healthy Radiance Gentle Renewing Cleanser",
    price: 20.20,
    description: description8,
    rating: 4.1,
    isFavourite: true,
  ),
];


const String description1 = "This oil-free moisturizer hydrates and soothes sensitive skin. Formulated with Glycerin, Vitamin B3, and La Roche-Posay Thermal Water to hydrate for up to 48-hours and help to replenish the skin's moisture barrier. With a limited number of ingredients in a light, mattifying texture, this hydrating formula improves skin comfort.";
const String description2 = "Lightweight yet deeply hydrating serum gives skin a revitalizing boost and improves elasticity.";
const String description3 =  "Premium White Truffles carefully extracted from Piedmont, Italy, infused with Tocopherol(vitamin E) make d'Alba's signature ingredient Trufferol. Full of antioxidants, white truffles are 6 times more effective than well-known propolis.";
const String description4 =  "Refreshing oil-free face moisturizer with aloe bioferment and hyaluronic acid delivers instant hydration that soothes in 3 seconds. 100% instantly show a boost in hydration and glow.";
const String description5 =  "Clinique's most advanced anti-aging serum with 9.5% peptides and 1% advanced retinoid. Helps reduce the look of wrinkles, visibly lift, smooth, firm, and boost radiance. 100% show visibly reduced lines and wrinkles.*";
const String description6 =  "Enriched with 96.3% skin-boosting ingredient snail secretion filtrate. Light-weight essence which absorbs into the skin fast to give skin a natural glow from the inside. This essence is created from nutritious, low-stimulation filtered snail mucin to keep your skin moisturized and illuminated all day.";
const String description7 =  "An overnight, hydrating gel mask that quickly absorbs while you sleep to deeply hydrate skin.";
const String description8 = "This 3-in-1 cleanser offers gentle exfoliation using Vitamin E-infused jojoba beads to deeply cleanse the skin to reveal brighter, healthier skin in just 14 days. Formulated with GentleBright Technology™ containing Sea Daffodil and Niacinamide to help with improving the appearance of skin ageing and to even out skin tone while still respecting the skin barrier, making it the ideal brightening cleanser for those with sensitive skin.";

