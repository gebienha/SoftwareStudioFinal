import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference favorites = FirebaseFirestore.instance.collection("favorites");

  Future<void> addFavorite(int id) {
    return favorites.add({'itemID': id});
  }

  Future<void> removeFavorite(int id) async {
    final snapshot = await favorites.where('itemID', isEqualTo: id).get();
    for (var doc in snapshot.docs) {
      await favorites.doc(doc.id).delete();
    }
  }

  Future<List<int>> getFavoriteIds() async {
    final snapshot = await favorites.get();
    return snapshot.docs.map((doc) => doc['itemID'] as int).toList();
  }
}
