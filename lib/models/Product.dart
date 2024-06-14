import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description, detail, recommend, benefit, ingredient, howto;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool  isPopular;
  bool isFavourite;
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
    required this.detail,
    required this.recommend,
    required this.benefit,
    required this.ingredient,
    required this.howto

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
    title: "La Roche-Posay Tolerriane Fluide Oil Free Moisturizer",
    price: 30.99,
    description: briefdescription1,
    detail: description1,
    recommend: recommend1,
    benefit: benefit1,
    ingredient: ingredient1,
    howto: howto1,
    rating: 4.8,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/pixi.png",
      "assets/images/pixi2.png",
      "assets/images/pixi3.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Pixi Hydrating Milky Serum",
    price: 24.00,
    description: briefdescription2,
    detail: description2,
    recommend: recommend2,
    benefit: benefit2,
    ingredient: ingredient2,
    howto: howto2,
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
    description: briefdescription3,
    detail: description3,
    recommend: recommend3,
    benefit: benefit3,
    ingredient: ingredient3,
    howto: howto3,
    rating: 4.1,
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
    description: briefdescription4,
    detail: description4,
    recommend: recommend4,
    benefit: benefit4,
    ingredient: ingredient4,
    howto: howto4,
    rating: 4.1,
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
    description: briefdescription5,
    detail: description5,
    recommend: recommend5,
    benefit: benefit5,
    ingredient: ingredient5,
    howto: howto5,
    rating: 4.8,
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
    description: briefdescription6,
    detail: description6,
    recommend: recommend6,
    benefit: benefit6,
    ingredient: ingredient6,
    howto: howto6,
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
    description: briefdescription7,
    detail: description7,
    recommend: recommend7,
    benefit: benefit7,
    ingredient: ingredient7,
    howto: howto7,
    rating: 4.1,
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
    description: briefdescription8,
    detail: description8,
    recommend: recommend8,
    benefit: benefit8,
    ingredient: ingredient8,
    howto: howto8,
    rating: 4.1,
  ),
];

const String briefdescription1 = "Recommended by 90.000 dematologists worldwide\n\nLightweight, Oil-Free Face Moisturizer\n\n• Hydrates for up to 48 hours\n• Replenishes the skin's moisture barrier\n• Mattifying texture ideal for combination to oily skin\n";
const String briefdescription2 = "Lightweight yet deeply hydrating serum gives skin a revitalizing boost and improves elasticity";
const String briefdescription3 = "";
const String briefdescription4 =  "Refreshing oil-free face moisturizer with aloe bioferment and hyaluronic acid delivers instant hydration that soothes in 3 seconds. 100% instantly show a boost in hydration and glow.";
const String briefdescription5 =  "Clinique's most advanced anti-aging serum with 9.5% peptides and 1% advanced retinoid. Helps reduce the look of wrinkles, visibly lift, smooth, firm, and boost radiance. 100% show visibly reduced lines and wrinkles.*";
const String briefdescription6 =  "Enriched with 96.3% skin-boosting ingredient snail secretion filtrate. Light-weight essence which absorbs into the skin fast to give skin a natural glow from the inside. This essence is created from nutritious, low-stimulation filtered snail mucin to keep your skin moisturized and illuminated all day.";
const String briefdescription7 =  "An overnight, hydrating gel mask that quickly absorbs while you sleep to deeply hydrate skin.";
const String briefdescription8 = "This 3-in-1 cleanser offers gentle exfoliation using Vitamin E-infused jojoba beads to deeply cleanse the skin to reveal brighter, healthier skin in just 14 days. Formulated with GentleBright Technology™ containing Sea Daffodil and Niacinamide to help with improving the appearance of skin ageing and to even out skin tone while still respecting the skin barrier, making it the ideal brightening cleanser for those with sensitive skin.";



const String description1 = "This oil-free moisturizer hydrates and soothes sensitive skin. Formulated with Glycerin, Vitamin B3, and La Roche-Posay Thermal Water to hydrate for up to 48-hours and help to replenish the skin's moisture barrier. With a limited number of ingredients in a light, mattifying texture, this hydrating formula improves skin comfort." "\n\n• Dermatologist Tested\n•Suitable for sensitive skin\n• Paraben Free\n•Fragrance Free\n•Oil Free\n•Non-comedogenic\n• Allergy Tested\n• Preservative Free\n";
const String description2 = "• This nutrient-rich serum restores dehydrated skin, revealing its natural radiance.\n•Silky-smooth & lightweight, it gives a burst of hydration without a heavy feel.\n• Rose Flower extract, Jojoba Oil and Aloe Vera nourish, while Glycerin traps moisture to the skin for a plumped effect.\n• Volume: 30 ml / 1.01 fl oz" ;
const String description3 =  "Premium White Truffles carefully extracted from Piedmont, Italy, infused with Tocopherol(vitamin E) make d'Alba's signature ingredient Trufferol. Full of antioxidants, white truffles are 6 times more effective than well-known propolis.";
const String description4 =  "Refreshing oil-free face moisturizer with aloe bioferment and hyaluronic acid delivers instant hydration that soothes in 3 seconds. 100% instantly show a boost in hydration and glow.";
const String description5 =  "Clinique's most advanced anti-aging serum with 9.5% peptides and 1% advanced retinoid. Helps reduce the look of wrinkles, visibly lift, smooth, firm, and boost radiance. 100% show visibly reduced lines and wrinkles.*";
const String description6 =  "Enriched with 96.3% skin-boosting ingredient snail secretion filtrate. Light-weight essence which absorbs into the skin fast to give skin a natural glow from the inside. This essence is created from nutritious, low-stimulation filtered snail mucin to keep your skin moisturized and illuminated all day.";
const String description7 =  "An overnight, hydrating gel mask that quickly absorbs while you sleep to deeply hydrate skin.";
const String description8 = "This 3-in-1 cleanser offers gentle exfoliation using Vitamin E-infused jojoba beads to deeply cleanse the skin to reveal brighter, healthier skin in just 14 days. Formulated with GentleBright Technology™ containing Sea Daffodil and Niacinamide to help with improving the appearance of skin ageing and to even out skin tone while still respecting the skin barrier, making it the ideal brightening cleanser for those with sensitive skin.";

const String recommend1 = "Skin Concern: Sensitive skin \nSkin Type: Normal/Combination skin/Oily skin";
const String recommend2 = "For all skin types";
const String recommend3 = "";
const String recommend4 = "";
const String recommend5 = "";
const String recommend6 = "";
const String recommend7 = "";
const String recommend8 = "";

const String benefit1 = "• Oil-free face moisturizer soothes sensitive skin\n• Lightweight, mattifying texture ideal for combination to oily skin types\n• Provides up to 48-hour hydration\n• Replenishes the skin's moisture barrier\n";
const String benefit2 = "• Suited for all skin types\n• Not tested on animals\n• Paraben-free\n" "• Cruelty Free\n• Skin-loving Ingredients\n";
const String benefit3 = "";
const String benefit4 = "";
const String benefit5 = "";
const String benefit6 = "";
const String benefit7 = "";
const String benefit8 = "";

const String ingredient1 = "Key Ingredients: \n• Glycerin: Derived from vegetable sources, it's an excellent humectant. It helps hydrate skin by absorbing water from the surrounding environment.\n\n• La Roche-Posay Thermal Spring Water: A soothing water sourced in the town of La Roche-Posay in France and a core ingredient in most of our products. It contains a unique combination of minerals, trace elements, and a high concentration of selenium, a natural antioxidant.\n\nFull Ingredient List:\n AQUA / WATER / EAU • CAPRYLIC/CAPRIC TRIGLYCERIDE • GLYCERIN • PROPANEDIOL • PENTYLENE GLYCOL • NIACINAMIDE • AMMONIUM POLYACRYLOYLDIMETHYL TAURATE • CAPRYLYL GLYCOL • CITRIC ACID • XANTHAN GUM. (CODE F.I.L. : D216631/1)";
const String ingredient2 = "• Aloe Vera calms & soothes\n• Vitamins C & E nourish & heal\n• Jojoba Oil moisturizes with a light feel";
const String ingredient3 = "";
const String ingredient4 = "";
const String ingredient5 = "";
const String ingredient6 = "";
const String ingredient7 = "";
const String ingredient8 = "";

const String howto1 = "Step 1: After cleansing, apply to face and neck\nStep 2: Apply the moisturizer in gentle circular motions\nStep 3: Repeat application process morning and/or evening";
const String howto2 = "• Use: Either in the AM and PM or when needed\n• Step 1: Cleanse your skin with a Pixi Beauty facial cleanser\n• Step 2: Apply a Pixi Beauty Facial Toner\n • Step 3: Massage two to three drops of Hydrating Milky Serum onto clean, dry skin\n• Step 4: Apply Pixi Beauty facial moisturizer";
const String howto3 = "";
const String howto4 = "";
const String howto5 = "";
const String howto6 = "";
const String howto7 = "";
const String howto8 = "";
