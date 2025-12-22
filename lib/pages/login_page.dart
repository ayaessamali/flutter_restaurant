import 'package:flutter/material.dart';
import 'package:flutter_restaurant/component/my_button.dart';
import 'package:flutter_restaurant/component/my_textfield.dart';
import 'package:flutter_restaurant/pages/home_page.dart';
import 'package:flutter_restaurant/main.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers must be here in the State
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login methode
  void login() {
    /*
    fill out authentication here
     */
    //navigate to home page
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HomePage()),
    // );
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    emailCon.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(height: 25),

          // Message
          Text(
            'Food Delivery App',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 25),

          // Email text field
          MyTextfield(
            controller: emailCon,
            hintText: 'Email',
            obscureText: false,
          ),
          const SizedBox(height: 10),

          // Password text field
          MyTextfield(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 10),

          // Sign in button
          MyButton(text: "Sign In", onTap: login),

          const SizedBox(height: 25),

          // Not a member? Register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Register now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
