import 'package:flutter/material.dart';
import '../components/firestore_review.dart';

import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  final String productId; // Product ID to fetch reviews for
  final FirestoreService firestoreService = FirestoreService();

  Reviews({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: firestoreService.getReviewsForProduct(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("An error occurred."));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No reviews yet."));
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              ),
              ...snapshot.data!.map((review) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(review['image']),
                      radius: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                review['name'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSecondaryContainer
                                ),
                              ),
                              const SizedBox(width: 10),
                              ...List.generate(
                                5,
                                (starIndex) => Icon(
                                  Icons.star,
                                  color: starIndex < review['rating']
                                      ? Colors.amber
                                      : Colors.grey,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            review['comment'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onSecondaryContainer
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Usage Period: ${review['usagePeriod']}",
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              // color: Colors.grey,
                              color: Theme.of(context).colorScheme.onSecondaryContainer
                            ),
                          ),
                          Divider(color: Theme.of(context).colorScheme.onSecondaryContainer),
                        ],
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ],
          );
        }
      },
    );
  }
}
