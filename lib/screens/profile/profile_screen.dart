import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'components/profile_menu.dart';
import 'components/firestore.dart';
import 'components/profile_pic.dart';
import '../../screens/skintracker/skin_tracker.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? avatarSvgData;
  String? displayName;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  void _fetchUserProfile() async {
    UserProfileService userProfileService = UserProfileService();
    Map<String, String> profileData = await userProfileService.fetchUserProfile();
    setState(() {
      avatarSvgData = profileData['avatarSvg'];
      displayName = profileData['name'];
      isLoading = false;
    });
  }

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut().then((_) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInScreen.routeName,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF60C6A2)),
        leading: const SizedBox(), // This removes the back arrow
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  ProfilePic(
                    initialAvatarSvgData: avatarSvgData,
                    initialName: displayName,
                  ),
                  const SizedBox(height: 20),
                  ProfileMenu(
                    text: "My Account",
                    icon: "assets/icons/User Icon.svg",
                    press: () => {},
                  ),
                  ProfileMenu(
                    text: "Notifications",
                    icon: "assets/icons/Bell.svg",
                    press: () {},
                  ),
                  ProfileMenu(
                    text: "Settings",
                    icon: "assets/icons/Settings.svg",
                    press: () {},
                  ),
                  ProfileMenu(
                    text: "Skin Tracker",
                    icon: "assets/icons/Question mark.svg",
                    press: () {
                      Navigator.pushNamed(
                        context,
                        SkinTracker.routeName,
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "Log Out",
                    icon: "assets/icons/Log out.svg",
                    press: () => signUserOut(context),
                  ),
                ],
              ),
            ),
    );
  }
}
