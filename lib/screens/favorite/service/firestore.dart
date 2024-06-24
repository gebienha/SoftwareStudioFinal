import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference favorites =
      FirebaseFirestore.instance.collection("favorites");

  Future<void> addFavorite(int id) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await favorites.add({'userId': user.uid, 'itemID': id});
    }
  }

  Future<void> removeFavorite(int id) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await favorites
          .where('userId', isEqualTo: user.uid)
          .where('itemID', isEqualTo: id)
          .get();
      for (var doc in snapshot.docs) {
        await favorites.doc(doc.id).delete();
      }
    }
  }

  Future<List<int>> getFavoriteIds() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await favorites.where('userId', isEqualTo: user.uid).get();
      return snapshot.docs.map((doc) => doc['itemID'] as int).toList();
    } else {
      return []; // Handle case where user is not logged in
    }
  }

  Future<bool> isFavorite(int id) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await favorites
          .where('userId', isEqualTo: user.uid)
          .where('itemID', isEqualTo: id)
          .get();
      return snapshot.docs.isNotEmpty;
    } else {
      return false; // Handle case where user is not logged in
    }
  }
}
