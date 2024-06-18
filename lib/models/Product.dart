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
      "assets/images/dalba2.png",
      "assets/images/dalba3.png",
      "assets/images/dalba4.png"
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
      "assets/images/cliniques-moist1.png",
      "assets/images/clinique-moist-2.png"
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
      "assets/images/cosrx2.png",
      "assets/images/cosrx3.png",
      "assets/images/cosrx4.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "COSRX Advanced Snail 96 Mucin Power Essence",
    price: 25.40,
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
      "assets/images/laneige2.png",
      "assets/images/laneige3.png",
      "assets/images/laneige4.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Laneige Water Sleeping Mask",
    price: 32.55,
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
      "assets/images/cetaphil2.png",
      "assets/images/cetaphil3.png"
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
const String briefdescription3 = "A luxurious skincare product that combines the moisturizing benefits of white truffle extract with a vegan-friendly formula";
const String briefdescription4 =  "Refreshing oil-free face moisturizer with aloe bioferment and hyaluronic acid delivers instant hydration that soothes in 3 seconds. 100% instantly show a boost in hydration and glow.\n\n""Dermatologist tested. Safe for sensitive skin. Allergy tested. 100% fragrance free.";
const String briefdescription5 =  "Advanced skincare product designed to target and reduce the appearance of wrinkles and fine lines.";
const String briefdescription6 =  "Hydrating and repairing essence formulated with 96% snail mucin extract to enhance skin moisture and improve skin texture.";
const String briefdescription7 =  "An overnight, hydrating gel mask that quickly absorbs while you sleep to deeply hydrate skin.";
const String briefdescription8 = "A skin renewing cleanser with jojoba beads that deeply cleanses and melts into the skin, releasing Vitamin E while gently lifting away dullness-causing dead surface skin and impurities without drying your sensitive skin. The end result? A radiant, smoother, more even-toned skin you?ll love every single day.";



const String description1 = "This oil-free moisturizer hydrates and soothes sensitive skin. Formulated with Glycerin, Vitamin B3, and La Roche-Posay Thermal Water to hydrate for up to 48-hours and help to replenish the skin's moisture barrier. With a limited number of ingredients in a light, mattifying texture, this hydrating formula improves skin comfort." "\n\n• Dermatologist Tested\n•Suitable for sensitive skin\n• Paraben Free\n•Fragrance Free\n•Oil Free\n•Non-comedogenic\n• Allergy Tested\n• Preservative Free\n";
const String description2 = "• This nutrient-rich serum restores dehydrated skin, revealing its natural radiance.\n• Silky-smooth & lightweight, it gives a burst of hydration without a heavy feel.\n• Rose Flower extract, Jojoba Oil and Aloe Vera nourish, while Glycerin traps moisture to the skin for a plumped effect.\n• Volume: 30 ml / 1.01 fl oz" ;
const String description3 =  "1. Premium White Truffles carefully extracted from Piedmont, Italy, infused with Tocopherol(vitamin E) make d'Alba's signature ingredient Trufferol. Full of antioxidants, white truffles are 6 times more effective than well-known propolis *source: Phenolic Flavonoids Profile and Antioxidant Ability, and Effects on Cell Oxidative Stress of White Truffle (Tuber magnatum) and White Truffle Composition *condition: Comparison of total phenol content by distilled water fraction\n\n"
"2. Certified vegan after meticulous testing by Italian V-label, dermatologically tested, and hypoallergenic- it delivers a luxurious vegan experience that makeup artists and celebrities love.\n\n"
"3. A 27M Global Bestseller with over 100,000 reviews on the official d'Alba website.\n\n"
"4. Surfactant-free, the double layering of the serum and oil levels instantly moisturizes the skin with a refreshing, glowy finish. Shake the SERUM & OIL layer well before use.\n\n"
"5. Serum Layer: Italian white truffle extract, niacinamide, and chia seed extract for skin relief, elasticity, and glow.\n\n"
"6. Oil layer: avocado oil, sunflower seed oil, and other plant-based oils to lock in moisture and radiance.\n\n7. Convenient to use: the misting spray nozzle has easy application, allowing the spray serum to land pleasantly light on the skin.\n\n"
"8. Multi-functional: mist + serum + setting spray. It is suitable for every step of your skincare and makeup routine.\n*Dermatologically tested, hypoallergenic";
const String description4 =  "Many things can dehydrate your skin, including stress, lack of sleep, pollution, air travel, and time spent in the sun. Fight back with Moisture Surge™ 100H Hydrator. Our gel moisturizer penetrates deep into skin's surface for 100 hours of stabilizing hydration."
"Lightweight, refreshing moisturizer with hyaluronic acid provides a smooth canvas for makeup application.";
const String description5 =  "Clinique's most advanced anti-aging serum with 9.5% peptides and 1% advanced retinoid. Helps reduce the look of wrinkles, visibly lift, smooth, firm, and boost radiance. 100% show visibly reduced lines and wrinkles.*\n\n"
"Dermatologist developed and tested. Safe for sensitive skin. Allergy tested. 100% fragrance free.\n\n"
"• Helps strengthen skin to reduce the look of wrinkles.\n• Accelerate cell turnover to visibly smooth skin\n• Hydrates skin and instantly minimizes the appearance of fine, dry lines";
const String description6 =  "Enriched with 96.3% skin-boosting ingredient snail secretion filtrate. Light-weight essence which absorbs into the skin fast to give skin a natural glow from the inside. This essence is created from nutritious, low-stimulation filtered snail mucin to keep your skin moisturized and illuminated all day."
"Light-weight essence which absorbs into the skin fast to give skin a natural glow from the inside. This essence is created from nutritious, low-stimulation filtered snail mucin to keep your skin moisturized and illuminated all day.";
const String description7 =  "Laneige Water Sleeping Mask is an overnight gel mask that hydrates and revitalizes the skin while you sleep, featuring an innovative blend of hydro-ionized mineral water and calming scents for a refreshed, radiant complexion. This overnight mask is hypoallergenic and formulated with two new ingredients for even more revolutionary results.";
const String description8 = "This 3-in-1 cleanser offers gentle exfoliation using Vitamin E-infused jojoba beads that remove pollution particles, dead skin cells, dirt and impurities to instantly brighten and improve skin texture for brighter, healthier skin in just 14 days. It is formulated with the use of our own exclusive GentleBright Technology™ containing 2 key ingredients - Sea Daffodil and Niacinamide. Sea Daffodil reduces skin puffiness and reduces dark spots, while Niacinamide improves the appearance of skin ageing and evens out skin tone. This cleanser is also ideal for sensitive, dry or dehydrated skin, and defends against 5 signs of skin sensitivity including dryness, irritation, roughness, tightness and a weakened skin barrier. Use alongside the Cetaphil Bright Healthy Radiance range of products for the best results.";

const String recommend1 = "Skin Concern: Sensitive skin \nSkin Type: Normal/Combination skin/Oily skin";
const String recommend2 = "Skin Type: All";
const String recommend3 = "Skin Type: All";
const String recommend4 = "Skin Concern: Dry skin \nSkin Type: Very Dry to Dry, Dry Combination, Combination Oily, Oily";
const String recommend5 = "Skin Concern: Anti-Aging\nSkin Type: Very Dry to Dry, Dry Combination, Combination Oily, Oily";
const String recommend6 = "Skin Concern: Dull & rough skin, Dasrk spots & scars\nSkin Type: All";
const String recommend7 = "Skin Type: Normal, Dry";
const String recommend8 = "Skin Concern: Dull and uneven skin tone\nSkin Type: All";

const String benefit1 = "• Oil-free face moisturizer soothes sensitive skin\n• Lightweight, mattifying texture ideal for combination to oily skin types\n• Provides up to 48-hour hydration\n• Replenishes the skin's moisture barrier\n";
const String benefit2 = "• Suited for all skin types\n• Not tested on animals\n• Paraben-free\n" "• Cruelty Free\n• Skin-loving Ingredients\n";
const String benefit3 = "• Anti-aging\n• Improve Moisture\n• Ultra-hydration\n• Elasticity\n• Light finish\n• Antioxidant\n• All-in-one care\n• Can be used before, during, after makeup Whenever & Whereever & Anytime\n• Spray-type container for convenient use";
const String benefit4 = "• Fast-acting\n• Long-lasting hydration\n• Paraben-free\n• Fragrance free\n• Phthalates free\n• Oil free\n• Drying alcohol free";
const String benefit5 = "• Visibly repairs lines and wrinkles, firms, boosts radiance.\n• Dermatologist developed\n"
"• Dermatologist tested\n• Safe for sensitive skin\n• Suitable for post-procedure skin*\n• Allergy tested\n• Fragrance free\n"
"• Paraben-free\n• Phthalates free\n• Oil free\n• Drying alcohol free\n• Sodium lauryl sulfate\n• Sodium laureth sulfate\n• Drying alcohol";
const String benefit6 = "• Fades dark spots\n• Improves skin texture\n• Anti-aging\n• Intense Hydration";
const String benefit7 = "• Help add a hydrated glow while creating an optimal environment for the skin\n• Skin-friendly hydrating ingredient\n• Dermatology tested\n• 7-free formula (Animal ingredient, mineral oil, polyacrylamide, imidazolidinyl urea, triethanolamine, synthetic pigments, PEG surfactant)";
const String benefit8 = "• Clears away dead skin cells, dirt and impurities\n• Clinically proven to improve skin texture and pore appearance to reveal skin that is brighter and more radiant\n• Cleanses without irritating, weakening or drying out the skin\n"
"• Fragrance free\n• Paraben free\n• Hypoallergenic\n• Dermatologically tested\n• Defends against 5 signs of skin sensitivity";

const String ingredient1 = "Key Ingredients: \n• Glycerin: Derived from vegetable sources, it's an excellent humectant. It helps hydrate skin by absorbing water from the surrounding environment.\n\n• La Roche-Posay Thermal Spring Water: A soothing water sourced in the town of La Roche-Posay in France and a core ingredient in most of our products. It contains a unique combination of minerals, trace elements, and a high concentration of selenium, a natural antioxidant.\n\nFull Ingredient List:\n AQUA / WATER / EAU • CAPRYLIC/CAPRIC TRIGLYCERIDE • GLYCERIN • PROPANEDIOL • PENTYLENE GLYCOL • NIACINAMIDE • AMMONIUM POLYACRYLOYLDIMETHYL TAURATE • CAPRYLYL GLYCOL • CITRIC ACID • XANTHAN GUM. (CODE F.I.L. : D216631/1)";
const String ingredient2 = "• Aloe Vera calms & soothes\n• Vitamins C & E nourish & heal\n• Jojoba Oil moisturizes with a light feel";
const String ingredient3 = "White Truffle, Avocado Oil";
const String ingredient4 = "Key Ingredients: \nAloe Bioferment + HA Complex, blend of vitamins C and E, Hyaluronic Acid";
const String ingredient5 = "Key Ingredients: \nDermal-active formula with 1% advanced retinoid, peptides, and hyaluronic acid";
const String ingredient6 = "Key Ingredients: \n• 96.3% snail secretion filtrate: \ndeliver rich nourishment through quick absorption\n\n• 1,000 ppm sodium hyaluronate:\nplumping and soothing care, infuses hydration"
"Full Ingredients:\nSnail Secretion Filtrate, Betaine, Butylene Glycol, 1,2-Hexanediol, Sodium Polyacrylate, Phenoxyethanol, Sodium Hyaluronate, Allantoin, Ethyl Hexanediol, Carbomer, Panthenol, Arginine";
const String ingredient7 = "Key Ingredients: Squalane, Hyaluronic Acid";
const String ingredient8 = "Full Ingredients:\nAqua, Decyl Glucoside, Glycerin, Sodium Cocoamphoacetate, Coco-Betaine, Sodium Chloride, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Phenoxyethanol, Jojoba Esters, Sodium Benzoate, Niacinamide, Tocopheryl Acetate, Xylitylglucoside, Anhydroxylitol, Xylitol, CI 77491, Pancratium Maritimum Extract";

const String howto1 = "Step 1: After cleansing, apply to face and neck\nStep 2: Apply the moisturizer in gentle circular motions\nStep 3: Repeat application process morning and/or evening";
const String howto2 = "• Use: Either in the AM and PM or when needed\n• Step 1: Cleanse your skin with a Pixi Beauty facial cleanser\n• Step 2: Apply a Pixi Beauty Facial Toner\n• Step 3: Massage two to three drops of Hydrating Milky Serum onto clean, dry skin\n• Step 4: Apply Pixi Beauty facial moisturizer";
const String howto3 = "For skincare:\nShake and spritz as much as you please right after cleansing to add moisture and nutrients to your skin. \nCan be used in between any step of your skincare\n\n"
"Before/After Makeup:\nShake and spritz before your makeup to prep your skin and after makeup to set it and add the glow";
const String howto4 = "• Use morning and night on clean skin\n• Can also be applied over makeup as a dewy highlighter\n• 5-minute face mask: Apply generously over skin. Tissue off.";
const String howto5 = "Use our face serum for anti-aging twice a day, morning and night.\n• Step 1: Dispense 1 to 2 pumps onto fingertips.\n• Step 2: Spread all over clean face and neck, avoiding eye area.\n• Step 3: Follow with your favorite Clinique Smart Clinical Repair™ moisturizer.";
const String howto6 = "• After cleansing and toning, apply a small amount on your entire face. \n• Gently pat using fingertips to aid absorption, and then go forth with your moisturizer. ";
const String howto7 = "• After applying face cream, get your mask ready!\n• Apply evenly across face\n• After product is absorbed completely, leave product overnight\n• Rinse off in the morning and use once or twice a week";
const String howto8 = "• Apply a coin-sized amount to damp palm. Use fingertips to create a luxurious lather. \n• Apply lather on to face and massage gently in a cicrular motion, avoiding the eye area. "
"\n• Rinse thoroughly, pat dry and follow up with Bright Healthy Radiance moisturizer. \n• Use 2 to 3 times a week as part of your cleansing routine.";
