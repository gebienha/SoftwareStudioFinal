// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class DiscountBanner extends StatefulWidget {
//   const DiscountBanner({Key? key}) : super(key: key);

//   @override
//   _DiscountBannerState createState() => _DiscountBannerState();
// }

// class _DiscountBannerState extends State<DiscountBanner> {
//   String firstName = '';
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchFirstName();
//   }

//   Future<void> fetchFirstName() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final uid = user.uid;
//         final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
//         if (doc.exists) {
//           setState(() {
//             firstName = doc.data()?['firstName'] ?? 'User';
//             isLoading = false;
//           });
//         }
//       }
//     } catch (e) {
//       // Handle error
//       setState(() {
//         firstName = 'User';
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(
//         child: isLoading
//             ? CircularProgressIndicator() // Display a loading indicator while fetching data
//             : RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: "Hello, ",
//                       style: TextStyle(
//                         fontSize: 20, // Smaller font size for the first line
//                         color: Theme.of(context).colorScheme.onSecondaryContainer,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "$firstName!\n",
//                       style: TextStyle(
//                         fontSize: 20, // Smaller font size for the first line
//                         color: Theme.of(context).colorScheme.onPrimaryContainer,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Search for your perfect ",
//                       style: TextStyle(
//                         fontSize: 24, // Bigger font size for the second line
//                         color: Theme.of(context).colorScheme.onSecondaryContainer,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "skincare",
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Theme.of(context).colorScheme.onPrimaryContainer, // Use the specific green color
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiscountBanner extends StatefulWidget {
  const DiscountBanner({Key? key}) : super(key: key);

  @override
  _DiscountBannerState createState() => _DiscountBannerState();
}

class _DiscountBannerState extends State<DiscountBanner> {
  String firstName = 'User';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFirstName();
  }

  Future<void> fetchFirstName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final uid = user.uid;
        final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (doc.exists && doc.data() != null) {
          setState(() {
            firstName = doc.data()?['firstName'] ?? 'User';
            isLoading = false;
          });
        } else {
          // If the Firestore document does not exist, use the display name from the user object
          setState(() {
            firstName = user.displayName ?? 'User';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      // Handle error
      setState(() {
        firstName = 'User';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator() // Display a loading indicator while fetching data
            : RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: TextStyle(
                        fontSize: 20, // Smaller font size for the first line
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    TextSpan(
                      text: "$firstName!\n",
                      style: TextStyle(
                        fontSize: 20, // Smaller font size for the first line
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    TextSpan(
                      text: "Search for your perfect ",
                      style: TextStyle(
                        fontSize: 24, // Bigger font size for the second line
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
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
