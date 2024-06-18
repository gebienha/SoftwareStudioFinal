// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../constants.dart';
// import '../models/Product.dart';
// import 'package:shop_app/screens/favorite/service/firestore.dart';

// class FavoriteCard extends StatefulWidget {
//   const FavoriteCard({
//     Key? key,
//     this.width = 140,
//     this.aspectRatio = 0.83,
//     required this.product,
//     required this.onPress,
//     required this.onFavoriteToggled,
//   }) : super(key: key);

//   final double width, aspectRatio;
//   final Product product;
//   final VoidCallback onPress;
//   final VoidCallback onFavoriteToggled;

//   @override
//   _FavoriteCardState createState() => _FavoriteCardState();
// }

// class _FavoriteCardState extends State<FavoriteCard> {
//   late bool isFavourite;
//   final FirestoreService _firestoreService = FirestoreService();

//   @override
//   void initState() {
//     super.initState();
//     isFavourite = widget.product.isFavourite;
//   }

//   void toggleFavourite() async {
//     setState(() {
//       isFavourite = !isFavourite;
//       widget.product.isFavourite = isFavourite;
//     });

//     if (isFavourite) {
//       await _firestoreService.addFavorite(widget.product.id);
//     } else {
//       // Assuming you have a method to remove a favorite by itemID
//       await _firestoreService.removeFavorite(widget.product.id);
//     }

//     widget.onFavoriteToggled();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onPress,
//       child: Container(
//         width: widget.width,
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: kSecondaryColor.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             // Container for the picture
//             Container(
//               height: widget.width * widget.aspectRatio,
//               width: widget.width * widget.aspectRatio,
//               decoration: BoxDecoration(
//                 color: kSecondaryColor.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Image.asset(
//                 widget.product.images[0],
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Product Name and Rating
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           widget.product.title,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis, // To handle overflow
//                         ),
//                       ),
//                       Text(
//                         '${widget.product.rating}',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   // Product Description and Favorite Button
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           padding: const EdgeInsets.all(0),
//                           constraints: const BoxConstraints(
//                             maxHeight: 85, // Limit the height
//                           ),
//                           child: SingleChildScrollView(
//                             child: Text(
//                               widget.product.description,
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color.fromARGB(255, 59, 72, 65),
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: toggleFavourite,
//                         child: Container(
//                           padding: const EdgeInsets.all(6),
//                           height: 30,
//                           width: 30,
//                           decoration: BoxDecoration(
//                             color: isFavourite
//                                 ? kPrimaryColor.withOpacity(0.15)
//                                 : kSecondaryColor.withOpacity(0.1),
//                             shape: BoxShape.circle,
//                           ),
//                           child: SvgPicture.asset(
//                             "assets/icons/Heart Icon_2.svg",
//                             colorFilter: ColorFilter.mode(
//                               isFavourite
//                                   ? const Color(0xFFFF4848)
//                                   : const Color(0xFFDBDEE4),
//                               BlendMode.srcIn,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';
import '../models/Product.dart';
import 'package:shop_app/screens/favorite/service/firestore.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 0.83,
    required this.product,
    required this.onPress,
    required this.onFavoriteToggled,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;
  final VoidCallback onPress;
  final VoidCallback onFavoriteToggled;

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool isFavourite;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    isFavourite = widget.product.isFavourite;
  }

  void toggleFavourite() async {
    setState(() {
      isFavourite = !isFavourite;
      widget.product.isFavourite = isFavourite; // Update the product's isFavourite status
    });

    if (isFavourite) {
      await _firestoreService.addFavorite(widget.product.id);
    } else {
      await _firestoreService.removeFavorite(widget.product.id);
    }

    widget.onFavoriteToggled();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Container for the picture
            Container(
              height: widget.width * widget.aspectRatio,
              width: widget.width * widget.aspectRatio,
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                widget.product.images[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis, // To handle overflow
                        ),
                      ),
                      Text(
                        '${widget.product.rating}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Product Description and Favorite Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(
                            maxHeight: 85, // Limit the height
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.product.description,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 59, 72, 65),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: toggleFavourite,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: isFavourite
                                ? const Color(0xFFFFC0CB).withOpacity(0.15) // Pink color when favorite
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            colorFilter: ColorFilter.mode(
                              isFavourite
                                  ? const Color(0xFFFF4848)
                                  : const Color(0xFFDBDEE4),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
