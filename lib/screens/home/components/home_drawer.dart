import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../category/category_screen.dart';
import '../../../main.dart';
import 'package:shop_app/screens/favorite/favorite_screen.dart';

// Define your constants for color theme and fonts
const kPrimaryColor = Color.fromARGB(255, 97, 199, 162);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(4289131218), Color.fromARGB(255, 97, 199, 162)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.spa_outlined,
                  size: 32,
                  color: Color.fromRGBO(57, 55, 55, 1),
                ),
                SizedBox(width: 18),
                Text(
                  'BeautyBlendr',
                   style: TextStyle(
                    color: kTextColor,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 26,
              color: kTextColor,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: kTextColor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.pop(context); // Navigate to the Home screen
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart,
              size: 26,
              color: kTextColor,
            ),
            title: const Text(
              'Products',
              style: TextStyle(
                color: kTextColor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                '/categorizedproducts',
                arguments: 'all', // Pass the categoryId as argument
              ); // Navigate to the Home screen
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.category,
              size: 26,
              color: kTextColor,
            ),
            title: const Text(
              'Categories',
              style: TextStyle(
                color: kTextColor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(
                context,
                CategoriesScreen.routeName,
              ); // Navigate to the Categories screen
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.monitor_heart,
              size: 26,
              color: kTextColor,
            ),
            title: const Text(
              'Favorite',
              style: TextStyle(
                color: kTextColor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/favorite");
              // Navigator.pushNamed(context, '/favorite');  // Navigate to the Home screen
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.edit_calendar_outlined,
              size: 26,
              color: kTextColor,
            ),
            title: const Text(
              'Skin Tracker',
              style: TextStyle(
                color: kTextColor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/skin-tracker');  // Navigate to the Home screen
            },
          ),
        ],
      ),
    );
  }
}
