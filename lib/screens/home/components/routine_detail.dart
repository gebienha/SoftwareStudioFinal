import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/routinestep_detail.dart';

import 'package:flutter/material.dart';
import 'skincare_routine.dart';
import 'routine_detail.dart';
import 'routinestep_detail.dart';

class SkincareRoutineStepScreen extends StatefulWidget {
  static String routeName = "/skincare-routine-step";

  @override
  _SkincareRoutineStepScreenState createState() => _SkincareRoutineStepScreenState();
}

class _SkincareRoutineStepScreenState extends State<SkincareRoutineStepScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final skinTypeId = args['skinTypeId']!;
    //final stepId = args['stepId']!;
    final routineType = args['routineType']!;

    // Detailed descriptions for Dry skin type routines
    final Map<String, Map<String, Map<String, String>>> SkinCareRoutineDetails = {
      '1': {
        'Day': {
          'Cleanse': '''Washing your face removes excess oil and dirt that can clog pores and cause breakouts. Opt for a gentle, alcohol-free cleanser to avoid stripping too many oils you need to keep your skin barrier healthy. When cleansing in the morning, splash lukewarm water onto your face and gently rub a face wash with your fingertips. Then, rinse and pat your skin dry with a towel. You may need a more hydrating oil-based cleanser if you have dry skin. Cleanser with ceramides, glycerin, or hyaluronic acid help hydrate dry skin. Any cleanser rich in emollients is very suitable.''',
          'Toner': '''Depending on their ingredients, toners can help hydrate the skin or remove leftover oil and dirt. Toning is an optional morning step but can benefit people with dry or acne-prone skin. To apply, soak a cotton pad with toner and gently pat it onto your face. You can also splash some toners directly onto your face. If you have dry or sensitive skin, look for hydrating toners with hyaluronic acid or rose water.''',
          'Serum': '''A morning serum can help brighten, hydrate, and protect skin. Applying a serum with antioxidant properties—like vitamin C, vitamin E, or niacinamide—is best for daytime since these ingredients can help reduce environmental and UV damage. To apply a serum, gently tap the product into your face and neck. Vitamin C works for all skin types and can help brighten skin and fade hyperpigmentation. Vitamin E and hyaluronic acid serums can help hydrate dry skin.''',
          'Eye Cream': '''Eye creams are optional but can add moisture and hydration to your undereye skin. To apply, gently dab the cream under your undereye using your ring finger. For daytime eye creams, choose products with hydrating peptides, antioxidants like Vitamin C, and SPF to help protect your delicate undereye skin from sun damage. If you want to look more awake after a restless night, apply an eye cream with caffeine. A caffeine eye cream can help stimulate blood circulation, improving dark circles and puffy under eyes.''',
          'Moisturize': '''Massaging a moisturizer into your face and neck keeps your skin protected and hydrated all day. Moisturizers help increase the water content in your skin and seal in moisture. This is an important step to repair your skin barrier—the protective top layer of your skin (aka the epidermis). Rich moisturizers with ceramides, glycerin, or shea butter can help hydrate dry skin.''',
          'Sunscreen': '''Your last morning skincare step should always be sunscreen to protect your skin from UV rays. Daily sunscreen will reduce your risk of skin cancer, wrinkles, and sunspots. Look for a mineral or chemical sunscreen with broad-spectrum coverage and a sun protection factor (SPF) of 30 or higher. You should apply about a nickel-sized amount of sunscreen onto your face, neck, chest, and ears. Remember to reapply every 2 hours.''',
        },
        'Night': {
          'Cleanse': '''Cleansing your face at night removes any dirt and oil you accumulate throughout the day. You can use the same gentle, oil-based, or acne-fighting cleanser morning and night. The main difference to a nighttime cleansing routine is you may also need to remove makeup with an oil-free makeup remover or double cleanse. Sensitive and dry skin types may also benefit from double cleansing with an oil-based cleanser or balm that removes makeup and hydrates the skin.''',
          'Toner': '''Applying a nighttime toner with a cotton pad or splash to the face is not necessary. But nighttime toning can help hydrate dry skin or remove leftover grime after cleansing. You can also swap your usual morning toner for an exfoliating toner at night. You can use an exfoliating toner once or twice a week to help remove dead skin cells and unclog pores. You can still use hyaluronic acid or rose water toners to hydrate dry skin at night.''',
          'Spot Treatment': '''You can continue to use a spot treatment to zap pimples or fade dark spots at night. This can include applying a benzoyl peroxide or salicylic acid treatment for pimples. Or, you can use a hydroquinone or kojic acid treatment for hyperpigmentation. Avoid applying additional serums or retinol treatments to areas where you used a spot treatment. Alternating the nights you use spot treatments, serums, and retinol is even better to avoid irritation. You can also use hydrocolloid patches at night to help treat open pimples as you sleep.''',
          'Serums or Acne Treatments': '''A nighttime serum or all-over acne treatment is optional. But adding these to your routine can help treat acne and fine lines. Just make sure you only pick one to avoid irritating your skin with too many active ingredients. Some serums also act as a chemical exfoliator—removing dead skin cells that dull skin and clog pores. Try a hydrating serum with hyaluronic acid, vitamin E, peptides, or ceramides if you have dry skin. Dry and oily skin types can use AHAs like glycolic and lactic acid to hydrate, exfoliate, and smooth fine lines. These AHA serums can also help treat blackheads and pimples. A salicylic acid or azelaic acid serum can also help unclog pores and reduce inflammation if you have acne.''',
          'Retinol': '''Retinoids and retinol (a type of retinoid) are vitamin A derivatives that help treat acne and fine lines. These ingredients stimulate cell turnover and promote collagen production to help improve overall skin texture and prevent clogged pores. Retinol and other retinoid treatments make your skin sensitive to the sun and should always be used at night. If you're new to retinol, it can be irritating, so apply a pea-sized every other night.''',
          'Eye Cream': '''Applying a night eye cream to your delicate undereye can help add more moisture to repair skin and reduce fine lines. This is an optional step at night but is ideal for an anti-aging skincare routine for all skin types. When choosing a night eye cream, look for repairing or hydrating ingredients like retinol, niacinamide, or hyaluronic acid. These ingredients work for any skin type, but retinol may be too irritating if you have sensitive skin.''',
          'Moisturize or Night Cream': '''You can moisturize your skin at night with your usual moisturizer or apply a heavier night cream. Night creams aid nighttime skin repair and have a thicker consistency than your everyday moisturizer. Either way, it's essential to moisturize your skin at night to help return moisture and hydration lost during the day. Night creams with hyaluronic acid and glycerin add more nighttime moisture. Night creams may also have AHAs and retinol to help stimulate cell turnover, reduce fine lines, and even out skin tone as you sleep.''',
          'Face Oil': '''Face oils are an optional nighttime skincare step that can add even more moisture and hydration to the skin. After moisturizing, gently massage a few drops of your face oil into your face and neck. Face oils with fatty acids like argan or coconut oil are ideal for people with dry skin who need more moisture. Chamomile and rosehip oil can help soothe sensitive skin.''',
        },
      },
      '2': {
        'Day': {
          'Hydrating Cleanser': '''Washing your face removes excess oil and dirt that can clog pores and cause breakouts. Opt for a gentle, alcohol-free cleanser to avoid stripping too many oils you need to keep your skin barrier healthy. When cleansing in the morning, splash lukewarm water onto your face and gently rub a face wash with your fingertips. Then, rinse and pat your skin dry with a towel. You may need a more hydrating oil-based cleanser if you have dry skin. Cleanser with ceramides, glycerin, or hyaluronic acid help hydrate dry skin. Any cleanser rich in emollients is very suitable.''',
          'Toner': '''Depending on their ingredients, toners can help hydrate the skin or remove leftover oil and dirt. Toning is an optional morning step but can benefit people with dry or acne-prone skin. To apply, soak a cotton pad with toner and gently pat it onto your face. You can also splash some toners directly onto your face. If you have dry or sensitive skin, look for hydrating toners with hyaluronic acid or rose water.''',
          'Serum': '''A morning serum can help brighten, hydrate, and protect skin. Applying a serum with antioxidant properties—like vitamin C, vitamin E, or niacinamide—is best for daytime since these ingredients can help reduce environmental and UV damage. To apply a serum, gently tap the product into your face and neck. Vitamin C works for all skin types and can help brighten skin and fade hyperpigmentation. Vitamin E and hyaluronic acid serums can help hydrate dry skin.''',
          'Eye Cream': '''Eye creams are optional but can add moisture and hydration to your undereye skin. To apply, gently dab the cream under your undereye using your ring finger. For daytime eye creams, choose products with hydrating peptides, antioxidants like Vitamin C, and SPF to help protect your delicate undereye skin from sun damage. If you want to look more awake after a restless night, apply an eye cream with caffeine. A caffeine eye cream can help stimulate blood circulation, improving dark circles and puffy under eyes.''',
          'Moisturize': '''Massaging a moisturizer into your face and neck keeps your skin protected and hydrated all day. Moisturizers help increase the water content in your skin and seal in moisture. This is an important step to repair your skin barrier—the protective top layer of your skin (aka the epidermis). Rich moisturizers with ceramides, glycerin, or shea butter can help hydrate dry skin.''',
          'Sunscreen': '''Your last morning skincare step should always be sunscreen to protect your skin from UV rays. Daily sunscreen will reduce your risk of skin cancer, wrinkles, and sunspots. Look for a mineral or chemical sunscreen with broad-spectrum coverage and a sun protection factor (SPF) of 30 or higher. You should apply about a nickel-sized amount of sunscreen onto your face, neck, chest, and ears. Remember to reapply every 2 hours.''',
        },
        'Night': {
          'Hydrating Cleanser': '''Cleansing your face at night removes any dirt and oil you accumulate throughout the day. You can use the same gentle, oil-based, or acne-fighting cleanser morning and night. The main difference to a nighttime cleansing routine is you may also need to remove makeup with an oil-free makeup remover or double cleanse. Sensitive and dry skin types may also benefit from double cleansing with an oil-based cleanser or balm that removes makeup and hydrates the skin.''',
          'Toner': '''Applying a nighttime toner with a cotton pad or splash to the face is not necessary. But nighttime toning can help hydrate dry skin or remove leftover grime after cleansing. You can also swap your usual morning toner for an exfoliating toner at night. You can use an exfoliating toner once or twice a week to help remove dead skin cells and unclog pores. You can still use hyaluronic acid or rose water toners to hydrate dry skin at night.''',
          'Spot Treatment': '''You can continue to use a spot treatment to zap pimples or fade dark spots at night. This can include applying a benzoyl peroxide or salicylic acid treatment for pimples. Or, you can use a hydroquinone or kojic acid treatment for hyperpigmentation. Avoid applying additional serums or retinol treatments to areas where you used a spot treatment. Alternating the nights you use spot treatments, serums, and retinol is even better to avoid irritation. You can also use hydrocolloid patches at night to help treat open pimples as you sleep.''',
          'Serums or Acne Treatments': '''A nighttime serum or all-over acne treatment is optional. But adding these to your routine can help treat acne and fine lines. Just make sure you only pick one to avoid irritating your skin with too many active ingredients. Some serums also act as a chemical exfoliator—removing dead skin cells that dull skin and clog pores. Try a hydrating serum with hyaluronic acid, vitamin E, peptides, or ceramides if you have dry skin. Dry and oily skin types can use AHAs like glycolic and lactic acid to hydrate, exfoliate, and smooth fine lines. These AHA serums can also help treat blackheads and pimples. A salicylic acid or azelaic acid serum can also help unclog pores and reduce inflammation if you have acne.''',
          'Retinol': '''Retinoids and retinol (a type of retinoid) are vitamin A derivatives that help treat acne and fine lines. These ingredients stimulate cell turnover and promote collagen production to help improve overall skin texture and prevent clogged pores. Retinol and other retinoid treatments make your skin sensitive to the sun and should always be used at night. If you're new to retinol, it can be irritating, so apply a pea-sized every other night.''',
          'Eye Cream': '''Applying a night eye cream to your delicate undereye can help add more moisture to repair skin and reduce fine lines. This is an optional step at night but is ideal for an anti-aging skincare routine for all skin types. When choosing a night eye cream, look for repairing or hydrating ingredients like retinol, niacinamide, or hyaluronic acid. These ingredients work for any skin type, but retinol may be too irritating if you have sensitive skin.''',
          'Night Cream': '''You can moisturize your skin at night with your usual moisturizer or apply a heavier night cream. Night creams aid nighttime skin repair and have a thicker consistency than your everyday moisturizer. Either way, it's essential to moisturize your skin at night to help return moisture and hydration lost during the day. Night creams with hyaluronic acid and glycerin add more nighttime moisture. Night creams may also have AHAs and retinol to help stimulate cell turnover, reduce fine lines, and even out skin tone as you sleep.''',
          'Face Oil': '''Face oils are an optional nighttime skincare step that can add even more moisture and hydration to the skin. After moisturizing, gently massage a few drops of your face oil into your face and neck. Face oils with fatty acids like argan or coconut oil are ideal for people with dry skin who need more moisture. Chamomile and rosehip oil can help soothe sensitive skin.''',
        },
      },
      '3': {
        'Day': {
          'Cleanse': '''Washing your face removes excess oil and dirt that can clog pores and cause breakouts. Opt for a gentle, alcohol-free cleanser to avoid stripping too many oils you need to keep your skin barrier healthy. When cleansing in the morning, splash lukewarm water onto your face and gently rub a face wash with your fingertips. Then, rinse and pat your skin dry with a towel. You may need a more hydrating oil-based cleanser if you have dry skin. Cleanser with ceramides, glycerin, or hyaluronic acid help hydrate dry skin. Any cleanser rich in emollients is very suitable.''',
          'Toner': '''Depending on their ingredients, toners can help hydrate the skin or remove leftover oil and dirt. Toning is an optional morning step but can benefit people with dry or acne-prone skin. To apply, soak a cotton pad with toner and gently pat it onto your face. You can also splash some toners directly onto your face. If you have dry or sensitive skin, look for hydrating toners with hyaluronic acid or rose water.''',
          'Serum': '''A morning serum can help brighten, hydrate, and protect skin. Applying a serum with antioxidant properties—like vitamin C, vitamin E, or niacinamide—is best for daytime since these ingredients can help reduce environmental and UV damage. To apply a serum, gently tap the product into your face and neck. Vitamin C works for all skin types and can help brighten skin and fade hyperpigmentation. Vitamin E and hyaluronic acid serums can help hydrate dry skin.''',
          'Eye Cream': '''Eye creams are optional but can add moisture and hydration to your undereye skin. To apply, gently dab the cream under your undereye using your ring finger. For daytime eye creams, choose products with hydrating peptides, antioxidants like Vitamin C, and SPF to help protect your delicate undereye skin from sun damage. If you want to look more awake after a restless night, apply an eye cream with caffeine. A caffeine eye cream can help stimulate blood circulation, improving dark circles and puffy under eyes.''',
          'Moisturize': '''Massaging a moisturizer into your face and neck keeps your skin protected and hydrated all day. Moisturizers help increase the water content in your skin and seal in moisture. This is an important step to repair your skin barrier—the protective top layer of your skin (aka the epidermis). Rich moisturizers with ceramides, glycerin, or shea butter can help hydrate dry skin.''',
          'Sunscreen': '''Your last morning skincare step should always be sunscreen to protect your skin from UV rays. Daily sunscreen will reduce your risk of skin cancer, wrinkles, and sunspots. Look for a mineral or chemical sunscreen with broad-spectrum coverage and a sun protection factor (SPF) of 30 or higher. You should apply about a nickel-sized amount of sunscreen onto your face, neck, chest, and ears. Remember to reapply every 2 hours.''',
        },
      'Night': {
          'Cleanse': '''Cleansing your face at night removes any dirt and oil you accumulate throughout the day. You can use the same gentle, oil-based, or acne-fighting cleanser morning and night. The main difference to a nighttime cleansing routine is you may also need to remove makeup with an oil-free makeup remover or double cleanse. Sensitive and dry skin types may also benefit from double cleansing with an oil-based cleanser or balm that removes makeup and hydrates the skin.''',
          'Toner': '''Applying a nighttime toner with a cotton pad or splash to the face is not necessary. But nighttime toning can help hydrate dry skin or remove leftover grime after cleansing. You can also swap your usual morning toner for an exfoliating toner at night. You can use an exfoliating toner once or twice a week to help remove dead skin cells and unclog pores. You can still use hyaluronic acid or rose water toners to hydrate dry skin at night.''',
          'Spot Treatment': '''You can continue to use a spot treatment to zap pimples or fade dark spots at night. This can include applying a benzoyl peroxide or salicylic acid treatment for pimples. Or, you can use a hydroquinone or kojic acid treatment for hyperpigmentation. Avoid applying additional serums or retinol treatments to areas where you used a spot treatment. Alternating the nights you use spot treatments, serums, and retinol is even better to avoid irritation. You can also use hydrocolloid patches at night to help treat open pimples as you sleep.''',
          'Serums or Acne Treatments': '''A nighttime serum or all-over acne treatment is optional. But adding these to your routine can help treat acne and fine lines. Just make sure you only pick one to avoid irritating your skin with too many active ingredients. Some serums also act as a chemical exfoliator—removing dead skin cells that dull skin and clog pores. Try a hydrating serum with hyaluronic acid, vitamin E, peptides, or ceramides if you have dry skin. Dry and oily skin types can use AHAs like glycolic and lactic acid to hydrate, exfoliate, and smooth fine lines. These AHA serums can also help treat blackheads and pimples. A salicylic acid or azelaic acid serum can also help unclog pores and reduce inflammation if you have acne.''',
          'Retinol': '''Retinoids and retinol (a type of retinoid) are vitamin A derivatives that help treat acne and fine lines. These ingredients stimulate cell turnover and promote collagen production to help improve overall skin texture and prevent clogged pores. Retinol and other retinoid treatments make your skin sensitive to the sun and should always be used at night. If you're new to retinol, it can be irritating, so apply a pea-sized every other night.''',
          'Eye Cream': '''Applying a night eye cream to your delicate undereye can help add more moisture to repair skin and reduce fine lines. This is an optional step at night but is ideal for an anti-aging skincare routine for all skin types. When choosing a night eye cream, look for repairing or hydrating ingredients like retinol, niacinamide, or hyaluronic acid. These ingredients work for any skin type, but retinol may be too irritating if you have sensitive skin.''',
          'Night Cream': '''You can moisturize your skin at night with your usual moisturizer or apply a heavier night cream. Night creams aid nighttime skin repair and have a thicker consistency than your everyday moisturizer. Either way, it's essential to moisturize your skin at night to help return moisture and hydration lost during the day. Night creams with hyaluronic acid and glycerin add more nighttime moisture. Night creams may also have AHAs and retinol to help stimulate cell turnover, reduce fine lines, and even out skin tone as you sleep.''',
          'Face Oil': '''Face oils are an optional nighttime skincare step that can add even more moisture and hydration to the skin. After moisturizing, gently massage a few drops of your face oil into your face and neck. Face oils with fatty acids like argan or coconut oil are ideal for people with dry skin who need more moisture. Chamomile and rosehip oil can help soothe sensitive skin.''',
        },
      },
      '4': {
        'Day': {
          'Cleanse': '''Washing your face removes excess oil and dirt that can clog pores and cause breakouts. Opt for a gentle, alcohol-free cleanser to avoid stripping too many oils you need to keep your skin barrier healthy. When cleansing in the morning, splash lukewarm water onto your face and gently rub a face wash with your fingertips. Then, rinse and pat your skin dry with a towel. You may need a more hydrating oil-based cleanser if you have dry skin. Cleanser with ceramides, glycerin, or hyaluronic acid help hydrate dry skin. Any cleanser rich in emollients is very suitable.''',
          'Toner': '''Depending on their ingredients, toners can help hydrate the skin or remove leftover oil and dirt. Toning is an optional morning step but can benefit people with dry or acne-prone skin. To apply, soak a cotton pad with toner and gently pat it onto your face. You can also splash some toners directly onto your face. If you have dry or sensitive skin, look for hydrating toners with hyaluronic acid or rose water.''',
          'Serum': '''A morning serum can help brighten, hydrate, and protect skin. Applying a serum with antioxidant properties—like vitamin C, vitamin E, or niacinamide—is best for daytime since these ingredients can help reduce environmental and UV damage. To apply a serum, gently tap the product into your face and neck. Vitamin C works for all skin types and can help brighten skin and fade hyperpigmentation. Vitamin E and hyaluronic acid serums can help hydrate dry skin.''',
          'Eye Cream': '''Eye creams are optional but can add moisture and hydration to your undereye skin. To apply, gently dab the cream under your undereye using your ring finger. For daytime eye creams, choose products with hydrating peptides, antioxidants like Vitamin C, and SPF to help protect your delicate undereye skin from sun damage. If you want to look more awake after a restless night, apply an eye cream with caffeine. A caffeine eye cream can help stimulate blood circulation, improving dark circles and puffy under eyes.''',
          'Moisturize': '''Massaging a moisturizer into your face and neck keeps your skin protected and hydrated all day. Moisturizers help increase the water content in your skin and seal in moisture. This is an important step to repair your skin barrier—the protective top layer of your skin (aka the epidermis). Rich moisturizers with ceramides, glycerin, or shea butter can help hydrate dry skin.''',
          'Sunscreen': '''Your last morning skincare step should always be sunscreen to protect your skin from UV rays. Daily sunscreen will reduce your risk of skin cancer, wrinkles, and sunspots. Look for a mineral or chemical sunscreen with broad-spectrum coverage and a sun protection factor (SPF) of 30 or higher. You should apply about a nickel-sized amount of sunscreen onto your face, neck, chest, and ears. Remember to reapply every 2 hours.''',
        },
        'Night': {
          'Cleanse': '''Cleansing your face at night removes any dirt and oil you accumulate throughout the day. You can use the same gentle, oil-based, or acne-fighting cleanser morning and night. The main difference to a nighttime cleansing routine is you may also need to remove makeup with an oil-free makeup remover or double cleanse. Sensitive and dry skin types may also benefit from double cleansing with an oil-based cleanser or balm that removes makeup and hydrates the skin.''',
          'Toner': '''Applying a nighttime toner with a cotton pad or splash to the face is not necessary. But nighttime toning can help hydrate dry skin or remove leftover grime after cleansing. You can also swap your usual morning toner for an exfoliating toner at night. You can use an exfoliating toner once or twice a week to help remove dead skin cells and unclog pores. You can still use hyaluronic acid or rose water toners to hydrate dry skin at night.''',
          'Spot Treatment': '''You can continue to use a spot treatment to zap pimples or fade dark spots at night. This can include applying a benzoyl peroxide or salicylic acid treatment for pimples. Or, you can use a hydroquinone or kojic acid treatment for hyperpigmentation. Avoid applying additional serums or retinol treatments to areas where you used a spot treatment. Alternating the nights you use spot treatments, serums, and retinol is even better to avoid irritation. You can also use hydrocolloid patches at night to help treat open pimples as you sleep.''',
          'Serums or Acne Treatments': '''A nighttime serum or all-over acne treatment is optional. But adding these to your routine can help treat acne and fine lines. Just make sure you only pick one to avoid irritating your skin with too many active ingredients. Some serums also act as a chemical exfoliator—removing dead skin cells that dull skin and clog pores. Try a hydrating serum with hyaluronic acid, vitamin E, peptides, or ceramides if you have dry skin. Dry and oily skin types can use AHAs like glycolic and lactic acid to hydrate, exfoliate, and smooth fine lines. These AHA serums can also help treat blackheads and pimples. A salicylic acid or azelaic acid serum can also help unclog pores and reduce inflammation if you have acne.''',
          'Retinol': '''Retinoids and retinol (a type of retinoid) are vitamin A derivatives that help treat acne and fine lines. These ingredients stimulate cell turnover and promote collagen production to help improve overall skin texture and prevent clogged pores. Retinol and other retinoid treatments make your skin sensitive to the sun and should always be used at night. If you're new to retinol, it can be irritating, so apply a pea-sized every other night.''',
          'Eye Cream': '''Applying a night eye cream to your delicate undereye can help add more moisture to repair skin and reduce fine lines. This is an optional step at night but is ideal for an anti-aging skincare routine for all skin types. When choosing a night eye cream, look for repairing or hydrating ingredients like retinol, niacinamide, or hyaluronic acid. These ingredients work for any skin type, but retinol may be too irritating if you have sensitive skin.''',
          'Night Cream': '''You can moisturize your skin at night with your usual moisturizer or apply a heavier night cream. Night creams aid nighttime skin repair and have a thicker consistency than your everyday moisturizer. Either way, it's essential to moisturize your skin at night to help return moisture and hydration lost during the day. Night creams with hyaluronic acid and glycerin add more nighttime moisture. Night creams may also have AHAs and retinol to help stimulate cell turnover, reduce fine lines, and even out skin tone as you sleep.''',
          'Face Oil': '''Face oils are an optional nighttime skincare step that can add even more moisture and hydration to the skin. After moisturizing, gently massage a few drops of your face oil into your face and neck. Face oils with fatty acids like argan or coconut oil are ideal for people with dry skin who need more moisture. Chamomile and rosehip oil can help soothe sensitive skin.''',
        },
      },
    };

    final List<MapEntry<String, String>> routineSteps = SkinCareRoutineDetails[skinTypeId]?[routineType]?.entries.toList() ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$routineType Routine Steps'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: routineSteps.length,
        itemBuilder: (context, index) {
          final step = routineSteps[index];
          return SkincareRoutineStepDetailScreen(
            stepName: step.key,
            stepDescription: step.value,
            onNextStep: () {
              if (index < routineSteps.length - 1) {
                _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
              } else {
                Navigator.pop(context); // Navigate back if it's the last step
              }
            },
          );
        },
      ),
    );
  }
}
      


// Map<String, Map<String, String>> routineDetails;
//     if (skinTypeId == '1') {
//       routineDetails = drySkinRoutineDetails;
//     } else if (skinTypeId == '2') {
//       routineDetails = oilSkinRoutineDetails;
//     } else if (skinTypeId == '3') {
//       routineDetails = combiSkinRoutineDetails;
//     } else if (skinTypeId == '4') {
//       routineDetails = normalSkinRoutineDetails;
//     } else {
//       routineDetails = {};
//     }

//final routineSteps = routineDetails[routineType]?.entries.toList() ?? [];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$routineType Routine Steps'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView.builder(
//           itemCount: routineSteps.length,
//           itemBuilder: (context, index) {
//             final step = routineSteps[index];
//             return ListTile(
//               title: Text('${index + 1}. ${step.key}'),
//               subtitle: Text(step.value),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
