import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference reviews = FirebaseFirestore.instance.collection("reviews");

  Future<void> addReview(String productId, Map<String, dynamic> reviewData) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await reviews.add({
        ...reviewData,
        'productId': productId,
        'userId': user.uid,
        'timestamp': Timestamp.now(),
      });
    }
  }

  Future<List<Map<String, dynamic>>> getReviewsForProduct(String productId) async {
    final snapshot = await reviews.where('productId', isEqualTo: productId).get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
