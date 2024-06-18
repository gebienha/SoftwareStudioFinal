import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewsProvider with ChangeNotifier {
  //demo data for reviews
  final List<Map<String, dynamic>> _reviews = [
    {
      'rating': 5,
      'comment': 'Great product! Highly recommend.',
      'image': 'assets/images/user-1.png',
      'name': 'Kim Seokjin',
      'usagePeriod': '1 week',
    },
    {
      'rating': 4,
      'comment': 'Good quality, but a bit expensive.',
      'image': 'assets/images/user-2.jpeg',
      'name': 'Cha Eunwoo',
      'usagePeriod': '1 day',
    },
    {
      'rating': 3,
      'comment': 'Average product, not bad but not great either.',
      'image': 'assets/images/user-3.jpg',
      'name': 'Jang Wonyoung',
      'usagePeriod': '2 weeks',
    },
  ];

  List<Map<String, dynamic>> get reviews => _reviews;
  ReviewsProvider() {
    fetchReviews();
  }
  
  Future<void> fetchReviews() async {
    final snapshot = await FirebaseFirestore.instance.collection('reviews').get();
    _reviews.addAll(snapshot.docs.map((doc) => doc.data()).toList());
    notifyListeners();
  }

  Future<void> addReview(Map<String, dynamic> review) async {
    await FirebaseFirestore.instance.collection('reviews').add(review);
    _reviews.add(review);
    notifyListeners();
  }
}
