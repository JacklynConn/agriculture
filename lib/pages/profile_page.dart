import 'package:agriculture/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // PROFILE IMAGE
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.OamzV3kluF4F8x90_GsMwwHaHb?w=768&h=771&rs=1&pid=ImgDetMain'),
              ),
            ),
          ),
          // NAME
          Center(
            child: Text(
              "Mak Mach",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text("makmach1122@gmail.com",
                style: Theme.of(context).textTheme.bodySmall),
          ),
          const SizedBox(height: 25),
          ListTile(
            leading: const Icon(IconlyLight.bag),
            title: const Text("My Orders"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.infoSquare),
            title: const Text("About Us"),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.logout),
            title: const Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
