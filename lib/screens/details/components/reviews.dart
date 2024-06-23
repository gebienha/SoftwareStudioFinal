import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;

  const Reviews({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Reviews",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondaryContainer
            ),
          ),
        ),
        ...List.generate(
          reviews.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(reviews[index]['image']),
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
                            reviews[index]['name'],
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
                              color: starIndex < reviews[index]['rating']
                                  ? Colors.amber
                                  : Colors.grey,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        reviews[index]['comment'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSecondaryContainer
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Usage Period: ${reviews[index]['usagePeriod']}",
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
          ),
        ),
      ],
    );
  }
}
