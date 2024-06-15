import 'package:flutter/material.dart';

class ReviewsProvider with ChangeNotifier {
  //demo data for reviews
  final List<Map<String, dynamic>> _reviews = [
    {
      'rating': 5,
      'comment': 'Great product! Highly recommend.',
      'image': 'assets/images/user-1.png',
      'name': 'Kim Seokjin',
    },
    {
      'rating': 4,
      'comment': 'Good quality, but a bit expensive.',
      'image': 'assets/images/user-2.jpeg',
      'name': 'Cha Eunwoo',
    },
    {
      'rating': 3,
      'comment': 'Average product, not bad but not great either.',
      'image': 'assets/images/user-3.jpg',
      'name': 'Jang Wonyoung',
    },
  ];

  List<Map<String, dynamic>> get reviews => _reviews;

  void addReview(Map<String, dynamic> review) {
    _reviews.add(review);
    notifyListeners(); //notify listeners for data changed
  }
}
