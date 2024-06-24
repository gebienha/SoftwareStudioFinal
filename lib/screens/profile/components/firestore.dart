import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<Map<String, String>> fetchUserProfile() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      DocumentSnapshot doc = await users.doc(user.uid).get();
      if (doc.exists) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          print("Fetched User Data: $data"); // Debugging
          return {
            'avatarSvg': data['avatarSvg'] ?? '',
            'name': data['name'] ?? '',
          };
        }
      }
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }
  return {'avatarSvg': '', 'name': ''}; // Ensure the return type matches the expected format
}


  Future<void> saveUserProfile(String name, String avatarSvg) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await users.doc(user.uid).set({
        'name': name,
        'avatarSvg': avatarSvg,
      }, SetOptions(merge: true));
    } else {
      throw Exception("No user is currently logged in");
    }
  }

  Future<void> setAvatar(String svgData) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await users.doc(user.uid).set({
        'avatarSvg': svgData,
      }, SetOptions(merge: true));
    } else {
      throw Exception("No user is currently logged in");
    }
  }

  Future<String?> getAvatar() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await users.doc(user.uid).get();
      if (doc.exists) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        return data?['avatarSvg'] as String?;
      }
    }
    return null; // Handle case where user is not logged in or no avatar found
  }

  Future<bool> hasAvatar() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await users.doc(user.uid).get();
      return doc.exists && (doc.data() as Map<String, dynamic>?)?.containsKey('avatarSvg') == true;
    }
    return false; // Handle case where user is not logged in
  }
}
