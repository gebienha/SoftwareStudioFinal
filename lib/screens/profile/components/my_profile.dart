import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfilePage extends StatefulWidget {
  static const String routeName = "/myProfile";

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userProfile = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        firstName = userProfile['firstName'];
        lastName = userProfile['lastName'];
        phoneNumber = userProfile['phoneNumber'];
        address = userProfile['address'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onBackground),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Profile Information',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildProfileInfoRow(context, 'First Name', firstName),
                  const SizedBox(height: 10),
                  _buildProfileInfoRow(context, 'Last Name', lastName),
                  const SizedBox(height: 10),
                  _buildProfileInfoRow(context, 'Phone Number', phoneNumber),
                  const SizedBox(height: 10),
                  _buildProfileInfoRow(context, 'Address', address),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileInfoRow(BuildContext context, String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value ?? '',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onBackground,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
