import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/auth/login_or_register.dart';
import 'package:flutter_restaurant/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user موجود
        if (snapshot.hasData) {
          return const HomePage(); // هنا الصفحة الرئيسية الجديدة
        }
        // user مش موجود
        else {
          return const LoginOrRegister();
        }
      },
    );
  }
}