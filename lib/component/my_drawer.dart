import 'package:flutter/material.dart';
import 'package:flutter_restaurant/component/my_drawer_tile.dart';
import 'package:flutter_restaurant/pages/setting_page.dart';
import 'package:flutter_restaurant/services/auth/auth_service.dart';
import 'package:flutter_restaurant/auth/login_or_register.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void logout() async {
    final authService = AuthService();
    await authService.signOut();

    // بعد logout، نرجع لشاشة LoginOrRegister ونمسح كل الصفحات السابقة
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginOrRegister()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),
          MyDrawerTile(
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
            text: "H O M E",
          ),
          MyDrawerTile(
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
            text: "S E T T I N G",
          ),
          const Spacer(),
          MyDrawerTile(
            icon: Icons.logout,
            onTap: logout,
            text: "L O G O U T",
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}